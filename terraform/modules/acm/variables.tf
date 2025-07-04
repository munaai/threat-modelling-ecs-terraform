variable "domain_name" {
  description = "Fully Qualified Domain Name to secure"
  type        = string
}

variable "hosted_zone_id" {
  description = "Hosted Zone ID of the domain in Route 53"
  type        = string
}


variable "tags" {
  description = "Tags to apply to the ACM certificate"
  type        = map(string)
  default     = {}
}
