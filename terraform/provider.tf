#  Terraform block - Used to configure terraform itself
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}
resource "aws_s3_bucket" "tfvars_config" {
  bucket = "my-terraform-config-bucket"

  tags = {
    Name = "Terraform tfvars bucket"
  }
}
# Provider block - Tells terraform which cloud provider to interract with
provider "aws" {
  # Configuration options
}