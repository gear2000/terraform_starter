# AWS EC2 Instance Terraform Module

This module provisions a single EC2 instance with configurable settings including instance type, storage, networking, and security groups. It automatically selects the latest Ubuntu AMI that matches your filter criteria.

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hostname | the hostname for the ec2 instance | `string` | n/a | yes |
| ssh_key_name | the ssh key name to use for instance access | `string` | n/a | yes |
| aws_region | aws region where resources will be deployed | `string` | `"us-east-2"` | no |
| ami | ami id for the ec2 instance (note: not used by default) | `string` | `"ami-055750c183ca68c38"` | no |
| associate_public_ip_address | whether to assign a public ip address to the instance | `bool` | `true` | no |
| instance_type | ec2 instance type/size | `string` | `"t3.micro"` | no |
| disktype | ebs volume type for the root disk | `string` | `"gp2"` | no |
| disksize | size of the root disk in gb | `string` | `"20"` | no |
| user_data | base64-encoded script to run when the instance boots | `string` | `null` | no |
| ami_filter | filter pattern to find an ami | `string` | `"ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*"` | no |
| ami_owner | aws account id that owns the ami | `string` | `"099720109477"` | no |
| iam_instance_profile | iam instance profile to attach to the ec2 instance | `string` | `null` | no |
| subnet_id | vpc subnet id where the instance will be launched | `string` | `null` | no |
| security_group_ids | security group ids to associate with the instance (comma-separated) | `string` | `null` | no |
| cloud_labels | additional labels as a map | `map(string)` | `{}` | no |

## Output

| Output Name | Description | Value Source |
|-------------|-------------|-------------|
| `instance_id` | the id of the aws ec2 instance | `aws_instance.default.id` |
| `ami` | the ami id used to launch the instance | `aws_instance.default.ami` |
| `arn` | the arn of the instance | `aws_instance.default.arn` |
| `availability_zone` | the availability zone where the instance is deployed | `aws_instance.default.availability_zone` |
| `private_dns` | the private dns name assigned to the instance | `aws_instance.default.private_dns` |
| `private_ip` | the private ip address assigned to the instance | `aws_instance.default.private_ip` |
| `public_dns` | the public dns name assigned to the instance | `aws_instance.default.public_dns` |
| `public_ip` | the public ip address assigned to the instance | `aws_instance.default.public_ip` |

## Backend Configuration

It is best practice to include a backend.tf

Example backend configuration:
```hcl
terraform {
  backend "s3" {
    bucket         = <s3_bucket_for_tfstate>
    key            = <s3_key_for_tfstate>
    region         = <aws_region>
    dynamodb_table = <dynamodb_terraform_lock>  # optional: for state locking
    encrypt        = true
  }
}
```

## Usage

```hcl
module "ec2_instance" {
  source = "github.com/gear2000/terraform_starter?ref=ec2-v0.1"
  
  hostname      = "nginx"
  ami_filter    = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"
  instance_type = "t3.micro"
  subnet_id     = <subnet_id>
  disksize      = "30"
  
  cloud_labels = {
    Environment = "Development"
    Project     = "Nginx"
  }
}
```

## Notes

- Security group IDs should be provided as a comma-separated string
- User data should be Base64-encoded before being passed to the module
