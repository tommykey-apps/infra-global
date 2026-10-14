resource "aws_acm_certificate" "wildcard" {
  provider          = aws.us_east_1
  domain_name       = "*.tommykeyapp.com"
  validation_method = "DNS"

  tags = {
    Project = "shared"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ACM の DNS 検証用 CNAME。自動更新のたびに ACM が参照するため、常に残しておく
resource "aws_route53_record" "acm_validation" {
  for_each = {
    for o in aws_acm_certificate.wildcard.domain_validation_options : o.domain_name => o
  }

  zone_id = aws_route53_zone.main.zone_id
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  records = [each.value.resource_record_value]
  ttl     = 300
}
