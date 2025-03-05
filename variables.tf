variable "hostname" {
  default     = "test-ec2"
  description = "the hostname for the ec2 instance"
}

variable "ssh_key_name" {
  description = "name of the ssh key to use for the ec2 instance (optional)"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "aws region where resources will be deployed"
  default     = "us-east-2"
}

variable "ami" {
  description = "ami id for the ec2 instance"
  default     = "ami-055750c183ca68c38"
}

variable "associate_public_ip_address" {
  description = "whether to assign a public ip address to the instance"
  default     = true
}

variable "instance_type" {
  description = "ec2 instance type/size"
  default     = "t3.micro"
}

variable "disktype" {
  description = "ebs volume type for the root disk"
  default     = "gp2"
}

variable "disksize" {
  description = "size of the root disk in gb"
  default     = "20"
}

# this should be b64 encoded
variable "user_data" {
  description = "base64-encoded script to run when the instance boots"
  default     = null
}

variable "ami_filter" {
  description = "filter pattern to find an ami if ami variable is not specified"
  default     = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
}

variable "ami_owner" {
  description = "aws account id that owns the ami"
  default     = "099720109477" # Canonical
}

variable "iam_instance_profile" {
  description = "iam instance profile to attach to the ec2 instance"
  default     = null
}

variable "subnet_id" {
  description = "vpc subnet id where the instance will be launched"
  default     = null
}

variable "security_group_ids" {
  description = "security group ids to associate with the instance"
  default     = null
}

variable "cloud_labels" {
  description = "additional labels as a map"
  type        = map(string)
  default     = {}
}
