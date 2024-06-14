variable "worker_count" {
  description = "Number of worker nodes"
  type = number
}

variable "ami" {
  description = "AMI"
  type = string
}

variable "key" {
  description = "Key pair for instance init"
  type = string
}

variable "instance_type" {
  description = "Instance type for all instances"
  type = string
}