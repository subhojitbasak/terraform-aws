terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_security_group" "sgroup" {
  name        = "demo-sgroup"
  description = "Demo Security group"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    description = "SSH"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    description = "HTTP"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "s22" {
  ami           = "ami-0d13e3e640877b0b9"
  instance_type = "t2.micro"

  key_name = "private"

  vpc_security_group_ids = [aws_security_group.sgroup.id]

  tags = {
    Name = "myKeyedServer2"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("E:/Terraform_Project/aws-key-pair[name- subho]/private.pem") # Update the path to your SSH private key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo service httpd start",
    ]
  }
}

variable "region" {
  default = "ap-south-1"

}

variable "profile" {
  description = "AWS credentials profile you want to use"

}
