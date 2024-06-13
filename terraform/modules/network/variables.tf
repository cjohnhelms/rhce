variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "nat_interface_id" {
  description = "ID of the primary interface for NAT instance"
  type = string
}