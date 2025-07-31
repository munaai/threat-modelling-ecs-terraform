# ECS Fargate
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "Number of desired ECS tasks"
  type        = number
}

variable "cluster_insight_name" {
  description = "Name of the ECS cluster setting"
  type        = string
}

variable "cluster_insight_value" {
  description = "Value of the ECS cluster setting"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "task_family" {
  description = "Family name for ECS task definition"
  type        = string
}

variable "task_cpu" {
  description = "CPU units for the task"
  type        = string
}

variable "task_memory" {
  description = "Memory for the task"
  type        = string
}

variable "image_url" {
  description = "Image URL in ECR"
  type        = string
}

# IAM
variable "role_name" {
  description = "IAM role name"
  type        = string
}

variable "assume_service" {
  description = "Service to assume the IAM role"
  type        = string
}

variable "policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
}
variable "account_id" {
  description = "AWS account ID"
  type        = string
}

# Security Groups
variable "alb_sg_name" {
  type = string
}

variable "alb_sg_description" {
  type = string
}

variable "alb_ingress_http_from_port" {
  type = number
}

variable "alb_ingress_http_to_port" {
  type = number
}

variable "alb_ingress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to access the ALB"
}

variable "alb_ingress_https_from_port" {
  type = number
}

variable "alb_ingress_https_to_port" {
  type = number
}

variable "ecs_egress_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks ECS tasks can access"
}

variable "ecs_sg_name" {
  type = string
}

variable "ecs_sg_description" {
  type = string
}

variable "ecs_ingress_from_port" {
  type = number
}

variable "ecs_ingress_to_port" {
  type = number
}

variable "ecs_egress_from_port" {
  type = number
}

variable "ecs_egress_to_port" {
  type = number
}

variable "ingress_protocol" {
  type = string
}

variable "egress_protocol" {
  type = string
}

# ALB / ELB
variable "alb_name" {
  type = string
}

variable "alb_internal" {
  type    = bool
  default = false
}

variable "alb_deletion_protection" {
  type    = bool
  default = true
}

variable "target_group_name" {
  type = string
}

variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}

# Health Check
variable "health_check_path" {
  type    = string
  default = "/"
}

variable "health_check_interval" {
  type    = number
  default = 30
}

variable "health_check_timeout" {
  type    = number
  default = 5
}

variable "health_check_healthy_threshold" {
  type    = number
  default = 2
}

variable "health_check_unhealthy_threshold" {
  type    = number
  default = 2
}

variable "health_check_matcher" {
  type    = string
  default = "200"
}

# Route 53
variable "hosted_zone_id" {
  type = string
}

variable "record_name" {
  type = string
}

variable "record_type" {
  type    = string
  default = "A"
}

variable "ssl_policy" {
  type    = string
  default = "ELBSecurityPolicy-2016-08"
}

variable "https_listener_port" {
  type    = number
  default = 443
}

variable "https_listener_protocol" {
  type    = string
  default = "HTTPS"
}

# VPC & Subnets
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
}

# Tags
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

# HTTP → HTTPS Redirect
variable "http_listener_port" {
  type        = number
  description = "Port for HTTP listener"
}

variable "http_listener_protocol" {
  type        = string
  description = "Protocol for HTTP listener"
}

variable "http_redirect_status_code" {
  type        = string
  description = "Redirect status code (e.g., HTTP_301)"
}
