#resource "null_resource" "kube_config" {
#  depends_on = [output.region, output.cluster_name]
#  provisioner "local-exec" {
#    command = "aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)"
#  }
#}
