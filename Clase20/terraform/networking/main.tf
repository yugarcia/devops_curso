terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.10.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.1.1"

    name = var.vpc_name
    cidr = var.cidr

    azs             = var.azs
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

    tags = {
        Terraform = "true"
        Environment = "dev"
        OWNER = "edgaregonzalez@gmail.com"
    }
}