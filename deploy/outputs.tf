output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = data.kubernetes_service.lb.status.0.load_balancer.0.ingress.0.hostname
}

output "name_servers" {
  value = aws_route53_zone.primary.name_servers
}
