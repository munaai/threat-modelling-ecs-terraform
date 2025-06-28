#  Terraform block - Used to configure terraform itself
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

# Provider block - Tells terraform which cloud provider to interract with
provider "aws" {
  # Configuration options
}