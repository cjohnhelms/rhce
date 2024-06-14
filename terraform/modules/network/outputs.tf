output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "private_security_group" {
  value = [ aws_security_group.private.id ]
}

output "public_security_group" {
  value = [ aws_security_group.public.id ]
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}