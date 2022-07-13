terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

variable "users" {
  # type = map(string, object)
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "iam_users" {
  # count = length(var.usernames)
  # name  = var.usernames[count.index]
  for_each = var.users
  name     = each.value
  tags = {
    mentor : each.key
  }

}

