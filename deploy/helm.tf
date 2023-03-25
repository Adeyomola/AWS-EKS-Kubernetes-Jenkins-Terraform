resource "helm_release" "prometheus" {
  name             = "prometheus"
  create_namespace = true
  namespace        = "monitoring"
  version          = "~> 45.0.0"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  wait             = false
  values           = ["${file("../provision/ansible/alert.yml")}"]
}

resource "helm_release" "fluentd" {
  name       = "fluentd"
  namespace  = "kube-system"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "fluentd"
  wait       = false
}

resource "helm_release" "elasticsearch" {
  #  depends_on = [helm_release.aws_ebs_csi]
  name       = "elasticsearch"
  namespace  = "kube-system"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  wait       = false
  values     = ["${file("./values/elasticsearch.yml")}"]
}

#resource "helm_release" "aws_ebs_csi" {
#  name       = "aws-ebs-csi"
#  namespace  = "kube-system"
#  repository = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
#  chart      = "aws-ebs-csi-driver"
#  wait       = false
#}

resource "helm_release" "kibana" {
 depends_on = [helm_release.elasticsearch]
  name       = "kibana"
  namespace  = "kube-system"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
  wait       = false
  values     = ["${file("./values/kibana.yml")}"]
}

resource "helm_release" "mysql_exporter_profilr" {
  depends_on = [kubectl_manifest.deploy]
  name       = "mysqlexporter-${var.namespaces_list[0]}"
  chart      = "prometheus-mysql-exporter"
  namespace  = var.namespaces_list[0]
  repository = "https://prometheus-community.github.io/helm-charts"
  wait       = false
  values     = ["${file("../provision/ansible/db.yml")}"]
}

resource "helm_release" "mongodb_exporter_sock_shop" {
  depends_on = [kubectl_manifest.deploy]
  name       = "mongodbexporter${var.namespaces_list[1]}"
  chart      = "prometheus-mongodb-exporter"
  namespace  = var.namespaces_list[1]
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
