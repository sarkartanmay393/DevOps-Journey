data "aws_subnets" "default-subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default-vpc.id]
  }
}

