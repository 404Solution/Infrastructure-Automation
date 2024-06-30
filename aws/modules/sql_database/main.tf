provider "aws" {
  region = var.region
}

resource "aws_db_instance" "main" {
  identifier           = var.db_identifier
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = true
  publicly_accessible  = var.publicly_accessible
  multi_az             = var.multi_az

  vpc_security_group_ids = [var.vpc_security_group_id]
  db_subnet_group_name   = var.db_subnet_group_name

  tags = {
    Name = var.db_identifier
  }
}

resource "aws_db_subnet_group" "main" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}
