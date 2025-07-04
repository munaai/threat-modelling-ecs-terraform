variable "hosted_zone_id" {}
variable "record_name" {}
variable "alb_dns_name" {}
variable "alb_zone_id" {}
variable "record_type" {
  default = "A"
}