######################################
###... EKS manual script jobs
######################################

# Create ServiceAccount AWS ALB controlle and attach it with kubernetes cluster
resource "kubectl_manifest" "targetgroupbinding" {
  yaml_body = data.http.applytargetfroupbinding.body

  depends_on = [module.eks_iam_role]
}

# Helm install for AWS ALB ingress controll
resource "helm_release" "aws_ingress" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = var.service_account_namespace
  wait       = true
  timeout    = var.helm_albc_timeout

  set {
    name  = "clusterName"
    value = var.cluster_name
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "region"
    value = var.aws_region
  }

  set {
    name  = "vpcId"
    value = module.vpc.vpc_id
  }

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  depends_on = [kubectl_manifest.targetgroupbinding]
}