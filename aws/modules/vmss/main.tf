provider "aws" {
  region = var.region
}

resource "aws_launch_configuration" "main" {
  name                 = "${var.vmss_name}-launch-configuration"
  image_id             = var.ami
  instance_type        = var.instance_type
  security_groups      = [var.vpc_security_group_id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  launch_configuration = aws_launch_configuration.main.id

  tag {
    key                 = "Name"
    value               = var.vmss_name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_iam_role" "ssm_role" {
  name = "${var.vmss_name}-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${var.vmss_name}-ssm-role"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_policy_attachment" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.vmss_name}-ssm-profile"
  role = aws_iam_role.ssm_role.name
}
