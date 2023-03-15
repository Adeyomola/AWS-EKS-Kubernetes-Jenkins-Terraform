resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

resource "aws_route53_record" "ingress_record" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "simple-app.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = [data.kubernetes_service_v1.lb.status.0.load_balancer.0.ingress.0.hostname]
}
