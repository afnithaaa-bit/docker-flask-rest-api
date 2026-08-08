terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "flask_sg" {
  name        = "docker-flask-production-sg"
  description = "Security group for Docker Flask application"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask application"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker-flask-production-sg"
  }
}
resource "aws_instance" "flask_server" {
  instance_type = "t3.small"
  ami           = "ami-096f5760b00bcd95c"

  subnet_id = "subnet-035fbcc2eda343d18"

  key_name = "Oregonkey"

   tags = {
    Name = "docker-flask-production-server"
  }
}