data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/manifests/*.yml"
}

resource "kubectl_manifest" "deploy" {
  for_each  = toset(data.kubectl_path_documents.manifests.documents)
  yaml_body = each.value
}
