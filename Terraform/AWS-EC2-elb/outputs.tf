output "instances-info" {
  value = values(aws_instance.http-servers).*.id
}

output "lb-dns" {
  value = aws_elb.elb
}
