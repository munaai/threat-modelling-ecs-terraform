variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "assume_service" {
  type = string
}

variable "policy_name" {
  type = string
}
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
}
variable "account_id" {
  description = "AWS account ID"
  type        = string
}
