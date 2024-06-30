terraform {
  source = "../../modules/vnet"
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "devterraformstatetest"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

# inputs SQL database

/* 
inputs = {
  region                = "us-east-1"
  db_identifier         = "dev-db"
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "devdb"
  username              = "admin"
  password              = "password1234"
  parameter_group_name  = "default.mysql8.0"
  publicly_accessible   = false
  multi_az              = false
  vpc_security_group_id = "sg-07e5afabb4218fc1c"
  db_subnet_group_name  = "db-security-group"
  subnet_ids            = ["subnet-0970a31eb4e27db0a", "subnet-00904a1ab79ba2810"]
} */ 


# Inputs vm

/*
inputs = {
  region                      = "us-east-1"
  ami                         = "ami-01b799c439fd5516a"
  instance_type               = "t2.micro"
  instance_name               = "dev-vm"
  subnet_id                   = "subnet-0970a31eb4e27db0a"      
  vpc_security_group_id       = "sg-0484f13db64d4f5e0"
}*/


# Inputs vm2 with autoscaling

/* 
inputs = {
  region                = "us-east-1"
  ami                   = "ami-01b799c439fd5516a"
  instance_type         = "t2.micro"
  vmss_name             = "dev-vmss"
  subnet_ids            = ["subnet-0970a31eb4e27db0a", "subnet-00904a1ab79ba2810"] 
  vpc_security_group_id = "sg-0edb73e12e79a4a32" 
  desired_capacity      = 2
  max_size              = 3
  min_size              = 1
} */


# attaching ELB

/* inputs = {
  region                      = "us-east-1"
  ami                         = "ami-01b799c439fd5516a" 
  instance_type               = "t2.micro"
  instance_name               = "dev-vm"
  subnet_id                   = "subnet-0970a31eb4e27db0a"
  vpc_security_group_id       = "sg-0edb73e12e79a4a32"         
  subnet_ids                  = ["subnet-0970a31eb4e27db0a", "subnet-00904a1ab79ba2810"] 
  vpc_id                      = "vpc-0f5a417218a129c8d"  
}

*/