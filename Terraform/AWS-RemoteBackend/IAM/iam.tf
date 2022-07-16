terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
  backend "s3" {
    key            = "iam-env-project"
    bucket         = "rbs-bucket-sarkartanmay393"
    dynamodb_table = "lock-state-sarkartanmay393"
    encrypt        = true
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "user" {
  name = "user"
}
