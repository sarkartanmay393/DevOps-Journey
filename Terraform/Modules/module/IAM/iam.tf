terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

variable "enviroment" {
  default = "default"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = "${iam-user-name}-${enviroment}"
}

locals {
  iam-user-name = "sarkartanmay393"
} # local variables.
