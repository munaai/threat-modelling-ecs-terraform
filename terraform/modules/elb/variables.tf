variable "alb_name" {}
variable "alb_internal" {
  type    = bool
  default = false
}
variable "alb_deletion_protection" {
  type    = bool
  default = false
}
variable "alb_security_group_ids" {
  type = list(string)
}

variable "public_subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}

variable "target_group_name" {}
variable "target_group_protocol" {
  default = "HTTP"
}
variable "container_port" {
  type = number
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
