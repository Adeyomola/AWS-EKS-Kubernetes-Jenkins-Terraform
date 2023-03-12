data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/manifests/*.yml"
  vars = {
    db_user     = var.db_user
    db_password = var.db_password
  }
}

resource "kubectl_manifest" "deploy" {
  for_each  = toset(data.kubectl_path_documents.manifests.documents)
  yaml_body = each.value
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

data "kubernetes_ingress_v1" "ingress" {
depends_on = [resource.kubectl_manifest.deploy]
  metadata {
    name = "app-ingress"
  }
}
