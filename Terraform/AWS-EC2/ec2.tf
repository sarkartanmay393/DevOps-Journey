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

resource "aws_default_vpc" "default-vpc" {

}

resource "aws_default_subnet" "default-subnet" {
  availability_zone = "us-east-1a"
}

# creating a security group
resource "aws_security_group" "http-server-sg" {
  name   = "http-server-sg"
  vpc_id = aws_default_vpc.default-vpc.id
  ingress { # incoming traffic ingress
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # from any ip it can be accessed.
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {             # outgoing traffic egress
    from_port   = 0    # from all ports
    to_port     = 0    # to all ports
    protocol    = "-1" # any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "mentor"       = "The Great Shiva"
    "repeatWithMe" = "Har Har Mahadev"
  }
}

variable "http-server-key-pair" {
  default = "~/Documents/PrivateXD/demo-pair.pem"
}

# creating a amazon linux instance.
resource "aws_instance" "http-server" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  key_name               = "demo-pair"
  vpc_security_group_ids = [aws_security_group.http-server-sg.id]
  subnet_id              = aws_default_subnet.default-subnet.id

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
      "echo Lord Tanmay presents a httpserver on EC2 instance, live on ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }

}


