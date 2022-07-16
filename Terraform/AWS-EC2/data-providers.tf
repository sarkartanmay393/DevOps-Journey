data "aws_subnets" "default-subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default-vpc.id]

  }
}

# data "aws_ami" "amazon_linux_ami" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-*"]
#   }
#  # "ami-0cff7528ff583bf9a"
# }
