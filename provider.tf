provider "aws" {
  region = var.aws_region
  default_tags {
    tags = merge(
      var.cloud_labels,
      {
        orchestrated_by = "gear2000/terraform_starter"
      },
    )
  }
  ignore_tags {}
}

