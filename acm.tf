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
