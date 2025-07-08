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
  bucket = "my-terraform-config-bucket-muna"
  force_destroy = true
  tags = {
    Name = "Terraform tfvars bucket"
  }
}
resource "aws_s3_bucket_public_access_block" "tfvars_config_block" {
  bucket = aws_s3_bucket.tfvars_config.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# Provider block - Tells terraform which cloud provider to interract with
provider "aws" {
  # Configuration options
}