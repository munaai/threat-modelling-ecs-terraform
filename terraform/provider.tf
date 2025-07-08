#  Terraform block - Used to configure terraform itself
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-config-bucket-muna"
    key            = "state/devops-lab/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "terraform-locks" # Optional but recommended
  }
}

provider "aws" {
  region = "eu-west-2" # make sure this is set
}
