resource "helm_release" "prometheus" {
  name             = "prometheus"
  create_namespace = true
  namespace        = "monitoring"
  version          = "~> 45.0.0"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  wait             = false
}

resource "helm_release" "nginx_exporter" {
  name       = "nginxexporter"
  chart      = "prometheus-nginx-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  wait = false
  values = ["${file("nginx_values.yml")}"]
}

resource "helm_release" "mongodb_exporter" {
  name       = "mongodbexporter"
  chart      = "prometheus-mongodb-exporter"
  repository = "https://prometheus-community.github.io/helm-charts"
  wait = false
  values = ["${file("mongodb_values.yml")}"]
}
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
