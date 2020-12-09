terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
   region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# I am using a pre-generated keypair
resource "aws_key_pair" "mysshkey" {
  key_name = "mysshkey"
  public_key = "${file("~/.ssh/aws_lab.pub")}"
}

resource "aws_instance" "aws_lab_1" {
   ami = "ami-a4c7edb2"
   instance_type = "t2.micro"
   key_name = "aws_lab_1"

   tags {
     Name = "aws_lab"
   }
}
