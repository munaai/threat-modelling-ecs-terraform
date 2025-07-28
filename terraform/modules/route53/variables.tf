variable "hosted_zone_id" {
  type        = string
  description = "Route 53 Hosted Zone ID"
}

variable "record_name" {
  type        = string
  description = "DNS record name"
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the ALB"
}

variable "alb_zone_id" {
  type        = string
  description = "Zone ID of the ALB"
}

variable "record_type" {
  type        = string
  description = "Type of DNS record (e.g. A, CNAME)"
}
