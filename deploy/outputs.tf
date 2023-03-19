output "profilr_dns" {
  description = "The DNS name of the load balancer."
  value       = data.kubernetes_service_v1.lb.status.0.load_balancer.0.ingress.0.hostname
}

output "sock_shop_dns" {
  description = "The DNS name of the load balancer."
  value       = data.kubernetes_service_v1.lb-sock-shop.status.0.load_balancer.0.ingress.0.hostname
}

#output "name_servers" {
#  value = aws_route53_zone.primary.name_servers
#}

#output "sock_shop_lb_name" {
#  value = regex("[[:alnum:]]+", data.kubernetes_service_v1.lb-sock-shop.status.0.load_balancer.0.ingress.0.hostname)
#}
#
#output "profilr_lb_name" {
#  value = regex("[[:alnum:]]+", data.kubernetes_service_v1.lb.status.0.load_balancer.0.ingress.0.hostname)
#}
#
#output "sock_shop_np" {
#  value = data.kubernetes_service_v1.lb-sock-shop.spec.0.port.0.node_port
#}
#
#output "profilr_np" {
#  value = data.kubernetes_service_v1.lb.spec.0.port.0.node_port
#}
