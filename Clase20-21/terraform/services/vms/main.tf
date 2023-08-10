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

data "aws_subnet" "subnet" {
    filter {
        name   = "tag:Name"
        values = [var.subnet_filter]
    }
}
data "aws_vpc" "vpc" {
    filter {
        name   = "tag:Name"
        values = [var.vpc_filter]
    }
}


resource "aws_eip" "wordpress-eip" {
    tags = {
        Name="wordpress-eip"
        OWNER="edgaregonzalez@gmail.com"
    }
}
resource "aws_eip_association" "serverwindows-eip" {
    instance_id = aws_instance.serverwindows.id
    allocation_id = aws_eip.wordpress-eip.id
}
resource "aws_security_group" "serverwindows-sg" {
    name = "serverwindows-rdp-sg"
    description = "acceso remoto para administracion del equipo"
    vpc_id = data.aws_vpc.vpc.id
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["200.117.89.71/32"]
    }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }
}
resource "aws_instance" "serverwindows" {
    ami = "ami-0fc682b2a42e57ca2"
    instance_type = "t2.micro"
    key_name = "devops-educacionit"
    associate_public_ip_address = false
    vpc_security_group_ids = [aws_security_group.serverwindows-sg.id]
    subnet_id = data.aws_subnet.subnet.id

    tags = {
        Name="serverwindows"
        OWNER="edgaregonzalez@gmail.com"
    }
}