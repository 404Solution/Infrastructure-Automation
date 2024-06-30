provider "aws" {
  region = var.region
}

resource "aws_instance" "main" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_alb" "main" {
  name               = "${var.instance_name}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.vpc_security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.instance_name}-alb"
  }
}

resource "aws_alb_target_group" "main" {
  name     = "${var.instance_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
    Name = "${var.instance_name}-tg"
  }
}

resource "aws_alb_target_group_attachment" "main" {
  target_group_arn = aws_alb_target_group.main.arn
  target_id        = aws_instance.main.id
  port             = 80
}

resource "aws_alb_listener" "main" {
  load_balancer_arn = aws_alb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.main.arn
  }
}
