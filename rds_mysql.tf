provider "aws" {
  region="us-east-1"
}

# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {

  tags    = {
    Name  = "default vpc"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create default subnet if one does not exit
resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags   = {
    Name = "default subnet"
  }
}

# create security group for the ec2 instance
resource "aws_security_group" "RDS_security_group" {
  name        = "RDS security group"
  description = "allow access on port 3306"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description      = "http access"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "RDS security group"
  }
}

#create a RDS Database Instance
resource "aws_db_instance" "mysql_instance" {
  engine               = "mysql"
  identifier           = "myrdsinstance"
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t3.medium"
  username             = "admin"
  password             = "admin1234"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.RDS_security_group.id]
  skip_final_snapshot  = true
  publicly_accessible =  true
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.mysql_instance.address
 # sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.mysql_instance.port
 # sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.mysql_instance.username
  #sensitive   = true
}
