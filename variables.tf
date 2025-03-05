variable "aws_region" {
  default = "us-east-1"
}

variable "base_cidr" {
  default = "10.11"
}

variable "num_of_subnets" {
  default = 2
}

variable "vpc_name" {
  type        = string
  description = "vpc name"
  default     = "test-vpc"
}

variable "vpc_labels" {
  description = "VPC resource labels which are termed tags in aws"
  type        = map(string)
  default     = {}
}

variable "public_subnet_labels" {
  description = "public subnet labels which are termed tags in aws"
  type        = map(string)
  default     = { "kubernetes.io/role/elb" : "1" }
}

variable "private_subnet_labels" {
  description = "private subnet labels which are termed tags in aws"
  type        = map(string)
  default     = { "kubernetes.io/role/internal_elb" : "1" }
}

variable "cloud_labels" {
  description = "additional labels as a map"
  type        = map(string)
  default     = {}
}

variable "allowed_cidr" {
  description = "CIDR block allowed to access the security group"
  type        = string
  default     = "0.0.0.0/0"
}

