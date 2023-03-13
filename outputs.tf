output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = module.eks.cluster_security_group_id
}

output "region" {
  description = "AWS region"
  value       = var.region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "dns_name" {
  description = "The DNS name of the load balancer."
  value       = data.kubernetes_service.lb.status.0.load_balancer.0.ingress.0.hostname
}

output "name_servers" {
  value = aws_route53_zone.primary.name_servers
}
