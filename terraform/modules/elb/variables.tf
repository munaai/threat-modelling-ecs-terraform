variable "alb_name" {
  type = string
}
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
variable "vpc_id" {
  type = string
}

variable "target_group_name" {
  type = string
}
variable "target_group_protocol" {
  type    = string
  default = "HTTP"
}
variable "container_port" {
  type = number
}

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

variable "certificate_arn" {
  description = "ARN of the ACM certificate"
  type        = string
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

variable "https_listener_port" {
  type        = number
  description = "Port for HTTPS listener (used in redirect)"
}

