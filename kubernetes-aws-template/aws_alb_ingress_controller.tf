#########################################
### TargetGroupBinding     Deployment ###
### AWS Ingress Controller Deployment ###
#########################################

# Create ServiceAccount AWS ALB controlle and attach it with kubernetes cluster
resource "kubectl_manifest" "targetgroupbinding" {
  yaml_body  = data.http.applytargetfroupbinding.body

  depends_on = [module.iam_assumable_role_admin]
}

# Helm install for AWS ALB ingress controll
resource "helm_release" "aws_ingress" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = var.sa_namespace
  wait       = true
  timeout    = var.helm_timeout

  values = [<<EOF
clusterName: ${var.cluster_name}
region: ${var.aws_region}
serviceAccount:
  create: true
  annotations:
    eks.amazonaws.com/role-arn: arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.iam_alb_role_name}
  vpcId: ${module.vpc.vpc_id}
EOF
  ]

  depends_on = [kubectl_manifest.targetgroupbinding]
}
