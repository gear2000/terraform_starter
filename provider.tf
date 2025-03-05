provider "aws" {
  region = var.aws_region

  # default tags applied to all aws resources
  default_tags {
    tags = merge(
      var.cloud_labels,
      {
        orchestrated_by = "gear2000/terraform_starter"
      },
    )
  }
}
