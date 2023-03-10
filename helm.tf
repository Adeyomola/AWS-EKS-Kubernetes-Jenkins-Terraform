resource "helm_release" "lb_controller" {
  name = "lb_controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "lb_controller"
  namespace  = "default"
  version    = "1.4.4"

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "clusterName"
    value = module.eks.cluster_id
  }

  set {
    name  = "serviceAccount.name"
    value = "lb_controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.lb_controller.iam_role_arn
  }
}
