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

resource "aws_s3_bucket" "terrabucket" {
  bucket = "terrabucket-sarkartanmay393"
  # versioning {
  #   enabled = true
  # }
}

resource "aws_iam_user" "terraiam" {
  name = "terra_iam_user-sarkartanmay393"
}



# STATES : in a terrform operation.
# DESIRED - KNOWN - ACTUAL
