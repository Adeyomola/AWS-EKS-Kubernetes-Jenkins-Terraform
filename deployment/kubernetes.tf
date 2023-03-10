resource "kubernetes_manifest" "app" {
  manifest = yamldecode(file("${path.module}/manifests/app.yml"))
}

resource "kubernetes_manifest" "db" {
  manifest = yamldecode(file("${path.module}/manifests/mongo.yml"))
}

resource "kubernetes_manifest" "db-config-map" {
  manifest = yamldecode(file("${path.module}/manifests/mongo-config.yml"))
}

resource "kubernetes_manifest" "secrets" {
  manifest = yamldecode(file("${path.module}/manifests/mongo-secret.yml"))
}

data "kubernetes_service" "services" {
  metadata {
    name = "services"
  }
}
