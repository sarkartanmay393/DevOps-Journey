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
}

# creating a amazon linux instance.
resource "aws_instance" "http-server" {
  ami                    = "ami-0cff7528ff583bf9a" #data.aws_ami.amazon_linux_ami.id
  instance_type          = "t2.micro"
  key_name               = "demo-pair"
  vpc_security_group_ids = [aws_security_group.http-server-sg.id]
  subnet_id              = data.aws_subnets.default-subnets.ids[0]

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


