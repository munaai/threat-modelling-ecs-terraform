resource "aws_route53_record" "this" {
  zone_id = var.hosted_zone_id
  name    = var.record_name # e.g., app.munaibrahim.com
  type    = var.record_type

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
