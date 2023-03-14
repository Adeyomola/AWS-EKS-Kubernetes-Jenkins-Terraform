resource "null_resource" "kube_config" {
  depends_on = [module.eks.cluster_name, var.region]
  provisioner "local-exec" {
    command = <<EOT
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
EOT
  }
}
