output "route53_zone_id" {
  description = "Route 53 hosted zone ID for tommykeyapp.com"
  value       = aws_route53_zone.main.zone_id
}

output "acm_certificate_arn" {
  description = "ACM wildcard certificate ARN for *.tommykeyapp.com"
  value       = aws_acm_certificate.wildcard.arn
}
