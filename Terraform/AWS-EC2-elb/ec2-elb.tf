terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "http-server-key-pair" {
  # will be imported form .tfvars
}

resource "aws_default_vpc" "default-vpc" {
}

resource "aws_security_group" "elb-sg" {
  name   = "elb-sg"
  vpc_id = aws_default_vpc.default-vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
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
    "mentor"       = "The Great Shiva"
    "repeatWithMe" = "Har Har Mahadev"
  }

}

resource "aws_instance" "http-servers" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  key_name               = "demo-pair"
  vpc_security_group_ids = [aws_security_group.elb-sg.id]
  for_each               = toset(data.aws_subnets.default-subnets.ids)
  subnet_id              = each.value # will create instances correspond to subnets.

  tags = {
    "identifier" = each.value
  }

  connection {
    type        = "ssh"
    host        = self.public_dns
    user        = "ec2-user"
    private_key = file(var.http-server-key-pair)
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo service httpd start",
      "echo Lord came back with multiple instance with load balancer ${each.value}} | sudo tee /var/www/html/index.html"
    ]
  }

}

resource "aws_elb" "elb" {
  name            = "elb"
  subnets         = data.aws_subnets.default-subnets.ids
  security_groups = [aws_security_group.elb-sg.id]
  instances       = values(aws_instance.http-servers).*.id
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}



