output "cert_arn" {
  value = var.cert_arn != "" ? var.cert_arn : aws_acm_certificate.cert[0].arn
}

output "tenant_id" {
  value = local.next_tenant_id
}
