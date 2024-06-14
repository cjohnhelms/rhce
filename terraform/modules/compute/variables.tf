variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "private_security_group" {
  description = "Security group for private instance"
  type = list(string)
}

variable "public_security_group" {
  description = "Security group for public instance"
  type = list(string)
}

variable "private_subnet_id" {
  description = "ID of subnet"
  type = string
}

variable "public_subnet_id" {
  description = "ID of subnet"
  type = string
}

variable "worker_count" {
  description = "Number of worker nodes for lab"
  type = number
}

variable "ami" {
  description = "Version for Ubuntu image"
  type = string
}

variable "key" {
  description = "SSH key for instance init"
  type = string
}

variable "instance_type" {
  description = "Instance type for all instances"
  type = string
}