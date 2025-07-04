resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  tags = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# Use to_list() to allow indexing
locals {
  validation_option = tolist(aws_acm_certificate.this.domain_validation_options)[0]
}

resource "aws_route53_record" "cert_validation" {
  zone_id = var.hosted_zone_id
  name    = local.validation_option.resource_record_name
  type    = local.validation_option.resource_record_type
  records = [local.validation_option.resource_record_value]
  ttl     = 60
}
