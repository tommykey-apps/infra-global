resource "aws_route53_zone" "main" {
  name    = "tommykeyapp.com"
  comment = "HostedZone created by Route53 Registrar"
}
