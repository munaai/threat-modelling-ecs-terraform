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
  description = "name of the cluster setting name"
  type        = string
}

variable "cluster_insight_value" {
  description = "name of the cluster setting value"
  type        = string
}

variable "container_name" {
  description = "name of the container"
  type        = string
}

variable "container_port" {
  description = "container port"
  type        = number
}

variable "task_family" {
  description = "family name"
  type        = string
}

variable "task_cpu" {
  description = "cpu"
  type        = string
}

variable "task_memory" {
  description = "memory"
  type        = string
}

variable "image_url" {
  description = "link of the image in ecr"
  type        = string
}

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
variable "alb_name" {}
variable "alb_internal" {
  type    = bool
  default = false
}
variable "alb_deletion_protection" {
  type    = bool
  default = false
}

variable "target_group_name" {}
variable "target_group_protocol" {
  default = "HTTP"
}

variable "health_check_path" {
  default = "/"
}
variable "health_check_interval" {
  default = 30
}
variable "health_check_timeout" {
  default = 5
}
variable "health_check_healthy_threshold" {
  default = 2
}
variable "health_check_unhealthy_threshold" {
  default = 2
}
variable "health_check_matcher" {
  default = "200"
}

variable "listener_port" {
  default = 80
}
variable "listener_protocol" {
  default = "HTTP"
}
variable "hosted_zone_id" {}

variable "record_name" {}
variable "record_type" {
  default = "A"
}
variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
}

variable "ssl_policy" {
  default = "ELBSecurityPolicy-2016-08"
}
variable "https_listener_port" {
  default = 443
}

variable "https_listener_protocol" {
  default = "HTTPS"
}

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

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}


