output "aws-instance-all-details" {
  value = aws_instance.http-server
}

output "httpserver-link" {
  value = aws_instance.http-server.public_dns
}
