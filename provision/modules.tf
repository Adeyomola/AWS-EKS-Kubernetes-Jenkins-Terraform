data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "${local.cluster_name}-vpc"

  cidr = "10.0.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = local.cluster_name
  cluster_version = "1.25"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  create_cloudwatch_log_group = false

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 3
    }

    two = {
      name           = "node-group-2"
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 3
      desired_size   = 3
    }
  }
}

#module "aws_load_balancer_controller_iam_role" {
#  source                                 = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
#  role_name                              = "aws-load-balancer-controller"
#  attach_load_balancer_controller_policy = true
#  oidc_providers = {
#    ex = {
#      provider_arn               = module.eks.oidc_provider_arn
#      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
#    }
#  }
#}
