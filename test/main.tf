terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = var.region
}



resource "aws_vpc" "tfc_kbtest_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "tfc_kb_test"
  }
}

# resource "aws_default_vpc" "tfc_kthong_vpc" {
#   id = aws_vpc.tfc_kthong_vpc
# }

resource "aws_subnet" "tfc_kbtest_subnet_A" {
  vpc_id = aws_vpc.tfc_kbtest_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    "Name" = "tfc_kbtest_subnet_A"
  }
}

resource "aws_subnet" "tfc_kbtest_subnet_B" {
  vpc_id = aws_vpc.tfc_kbtest_vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    "Name" = "tfc_kbtest_subnet_B"
  }
}

resource "aws_security_group" "tfc_kbtest_sec_grp" {
  name        = "tfc_kbtest_sec_grp"
  vpc_id = aws_vpc.tfc_kbtest_vpc.id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "tfc_kbtest_ec2" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.tfc_kbtest_subnet_A.id
  # security_groups = [aws_security_group.tfc_kthong_sec_grp.name]
  # associate_public_ip_address = true
    tags = {
    Name = "tfc_kbtest_ec2"
  }
}
