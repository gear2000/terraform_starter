# AWS VPC Terraform Module

This Terraform module creates a simple VPC in AWS with public subnets. Private networking resources are available in the disabled folder along with common endpoint files for DynamoDB and S3 gateway endpoints.

## Variables

| Name | Description | Type | Default |
|------|-------------|------|---------|
| `aws_region` | aws region to deploy resources | string | `"us-east-1"` |
| `base_cidr` | base cidr block for vpc | string | `"10.11"` |
| `num_of_subnets` | number of subnets to create | number | `2` |
| `vpc_name` | name for the vpc | string | `"test-vpc"` |
| `vpc_labels` | vpc resource labels (tags in aws) | map(string) | `{}` |
| `public_subnet_labels` | public subnet labels (tags in aws) | map(string) | `{ "kubernetes.io/role/elb": "1" }` |
| `private_subnet_labels` | private subnet labels (tags in aws) | map(string) | `{ "kubernetes.io/role/internal_elb": "1" }` |
| `cloud_labels` | additional labels as a map | map(string) | `{}` |
| `allowed_cidr` | cidr block allowed to access the security group | string | `"0.0.0.0/0"` |

## Output

| Output Name | Description | Value Source |
|-------------|-------------|-------------|
| `internet_gateway_ids` | the comma separated list of internet gateway ids | `join(",", aws_internet_gateway.default[*].id)` |
| `public_route_table_id` | the id of the public route table | `aws_default_route_table.public.id` |
| `public_subnet_ids` | comma separated list of public subnet ids | `join(",", aws_subnet.public[*].id)` |
| `security_group_id` | id of the web server security group | `aws_security_group.web.id` |
| `vpc_id` | the id of the vpc | `aws_vpc.main.id` |
| `vpc_name` | the name tag of the vpc | `aws_vpc.main.tags.Name` |

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
module "vpc" {
  source = "github.com/gear2000/terraform_starter?ref=vpc-v0.1"
  
  vpc_name = "nginx-example"
  base_cidr = "10.0"
  num_of_subnets = 2
  allowed_cidr = "10.0.0.0/8"
  
  vpc_labels = {
    Environment = "Development"
    Project     = "Nginx"
  }
}
```
