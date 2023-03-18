resource "helm_release" "prometheus" {
  name             = "prometheus"
  create_namespace = true
  namespace        = "monitoring"
  version          = "~> 45.0.0"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  wait             = false
  values           = ["${file("../provision/ansible/alert.yml")}"]
  provisioner "local-exec" {
    command = "rm ../provision/ansible/alert.yml"
  }

}

resource "helm_release" "mongodb_exporter_profilr" {
  depends_on = [kubectl_manifest.deploy]
  name       = "mongodbexporterp"
  chart      = "prometheus-mongodb-exporter"
  namespace  = "profilr"
  repository = "https://prometheus-community.github.io/helm-charts"
  wait       = false
  values     = ["${file("../provision/ansible/db.yml")}"]
  provisioner "local-exec" {
    command = "rm ../provision/ansible/db.yml"
  }

}

resource "helm_release" "mongodb_exporter_sock_shop" {
  depends_on = [kubectl_manifest.deploy]
  name       = "mongodbexporterss"
  chart      = "prometheus-mongodb-exporter"
  namespace  = "sock-shop"
  repository = "https://prometheus-community.github.io/helm-charts"
  wait       = false
  values = ["${file("./values/cartsdb.yml")}",
  "${file("./values/ordersdb.yml")}", "${file("./values/userdb.yml")}"]
}

#resource "helm_release" "nginx_exporter" {
#  name       = "app"
#  chart      = "prometheus-nginx-exporter"
#  namespace  = "profilr"
#  repository = "https://prometheus-community.github.io/helm-charts"
#  wait       = false
#  values     = ["${file("nginx_values.yml")}"]
#}


#resource "helm_release" "aws_load_balancer_controller" {
#  depends_on = [module.aws_load_balancer_controller_iam_role]
#  name       = "aws-load-balancer-controller"
#
#  repository = "https://aws.github.io/eks-charts"
#  chart      = "aws-load-balancer-controller"
#  namespace  = "kube-system"
#
#  set {
#    name  = "replicaCount"
#    value = 1
#  }
#
#  set {
#    name  = "clusterName"
#    value = module.eks.cluster_name
#  }
#
#  set {
#    name  = "serviceAccount.name"
#    value = "aws-load-balancer-controller"
#  }
#
#  set {
#    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
#    value = module.aws_load_balancer_controller_iam_role.iam_role_arn
#  }
#}
