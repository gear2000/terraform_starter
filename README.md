# Terraform/OpenTofu Starter

This repository contains Terraform/OpenTofu modules and examples in different branches to showcase the modularity of Terraform.

- **Module branches**: `modules/<tf module name>`
  e.g.
     - [modules/vpc](https://github.com/gear2000/terraform_starter/tree/modules/vpc) - Creates VPC networking infrastructure with public subnets
     - [modules/ec2](https://github.com/gear2000/terraform_starter/tree/modules/ec2) - Provisions configurable EC2 instances with the latest Ubuntu AMI

- **Module releases**: The module releases are in the format `<tf module name>-v<release>`
  e.g.
     - vpc-v0.1
     - ec2-v0.1

- **Example branches**: `example-<name of example>`
  e.g.
     - [example-nginx-on-aws](https://github.com/gear2000/terraform_starter/tree/example-nginx-on-aws) - Demonstrates deploying a Docker-based Nginx server on AWS EC2

Most of the branches include CI for Terraform code using GitHub Actions.
CI runs found [here](https://github.com/gear2000/terraform_starter/actions)
