provider "aws" {
  region = "us-east-1"
}

data "aws_route53_zone" "selected" {
  name         = "singulr.ai"
  private_zone = false
}

resource "aws_acm_certificate" "cert" {
  count = var.cert_arn == "" ? 1 : 0

  domain_name               = "${var.customer_name}.singulr.ai"
  subject_alternative_names = ["api.${var.customer_name}.singulr.ai"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  for_each = var.cert_arn == "" ? {
    for dvo in aws_acm_certificate.cert[0].domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  } : {}

  zone_id = data.aws_route53_zone.selected.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "cert_validation" {
  count = var.cert_arn == "" ? 1 : 0

  certificate_arn = aws_acm_certificate.cert[0].arn

  validation_record_fqdns = [
    for record in aws_route53_record.validation : record.fqdn
  ]
}
