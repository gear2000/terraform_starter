variable "vpc_module_source" {
  description = "source url for the vpc module"
  type        = string
  default     = "github.com/gear2000/terraform_starter?ref=vpc-v0.1"
}

variable "ec2_module_source" {
  description = "source url for the ec2 module"
  type        = string
  default     = "github.com/gear2000/terraform_starter?ref=ec2-v0.1"
}

variable "aws_region" {
  description = "aws region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "name of the vpc"
  type        = string
  default     = "nginx-example"
}

variable "base_cidr" {
  description = "base cidr block for the vpc"
  type        = string
  default     = "10.0"
}

variable "num_of_subnets" {
  description = "number of subnets to create"
  type        = number
  default     = 2
}

variable "vpc_labels" {
  description = "labels to apply to vpc resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Nginx"
  }
}

variable "hostname" {
  description = "hostname for the ec2 instance"
  type        = string
  default     = "nginx-server"
}

variable "ssh_key_name" {
  description = "name of the ssh key to use for the ec2 instance (optional)"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "base64 encoded user data for the ec2 instance"
  type        = string
  default     = "IyEvYmluL2Jhc2gKCiMgaW5zdGFsbCBkb2NrZXIKYXB0LWdldCB1cGRhdGUKYXB0LWdldCBpbnN0YWxsIC15IGFwdC10cmFuc3BvcnQtaHR0cHMgY2EtY2VydGlmaWNhdGVzIGN1cmwgc29mdHdhcmUtcHJvcGVydGllcy1jb21tb24KY3VybCAtZnNTTCBodHRwczovL2Rvd25sb2FkLmRvY2tlci5jb20vbGludXgvdWJ1bnR1L2dwZyB8IGFwdC1rZXkgYWRkIC0KYWRkLWFwdC1yZXBvc2l0b3J5ICJkZWIgW2FyY2g9YW1kNjRdIGh0dHBzOi8vZG93bmxvYWQuZG9ja2VyLmNvbS9saW51eC91YnVudHUgbm9ibGUgc3RhYmxlIgphcHQtZ2V0IHVwZGF0ZQphcHQtZ2V0IGluc3RhbGwgLXkgZG9ja2VyLWNlIGRvY2tlci1jZS1jbGkgY29udGFpbmVyZC5pbwpzeXN0ZW1jdGwgc3RhcnQgZG9ja2VyCnN5c3RlbWN0bCBlbmFibGUgZG9ja2VyCgojIHNldHVwIHVwIG5ldHdvcmsgZm9yIG5naW54CmRvY2tlciBuZXR3b3JrIGNyZWF0ZSBuZ2lueAoKIyBjcmVhdGUgbmdpbnggY29udGFpbmVyCmRvY2tlciBydW4gLWQgXAogIC0tbmFtZSBuZ2lueCBcCiAgLS1yZXN0YXJ0IGFsd2F5cyBcCiAgLXAgODA6ODAgXAogIC0tbmV0d29yayBuZ2lueCBcCiAgbmdpbng6bGF0ZXN0CgplY2hvICJXYWl0aW5nIGZvciBuZ2lueCB0byBzdGFydC4uLiIKd2hpbGUgISBjdXJsIC1zIGh0dHA6Ly9sb2NhbGhvc3Q6ODAgPiAvZGV2L251bGw7IGRvCiAgZWNobyAiTmdpbnggbm90IHJlYWR5IHlldCwgd2FpdGluZy4uLiIKICBzbGVlcCA1CmRvbmUKCmVjaG8gIm5naW54IGlzIHVwIGFuZCBydW5uaW5nISIKZG9ja2VyIHBzIHwgZ3JlcCBuZ2lueAo="
}

variable "ami_filter" {
  description = "filter pattern to find the ami"
  type        = string
  default     = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "disksize" {
  description = "size of the root disk in gb"
  type        = string
  default     = "30"
}

variable "cloud_labels" {
  description = "labels to apply to ec2 resources"
  type        = map(string)
  default = {
    Environment = "Development"
    Project     = "Nginx"
  }
}