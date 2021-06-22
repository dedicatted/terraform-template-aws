#############################################
### AIM Policy & Role. Step #3            ###
#############################################

resource "aws_iam_policy" "AWSLoadBalancerController" {
  name_prefix = "AWSLoadBalancerController"
  description = "EKS ALB ingress controller"
  policy      = file("kubernetes-aws-template/files/loadbalancercontroller.json")

  depends_on = [module.kubecluster]
}

module "iam_assumable_role_admin" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  create_role                   = true
  role_name                     = var.iam_alb_role_name
  provider_url                  = module.kubecluster.cluster_oidc_issuer_url
  role_policy_arns              = [aws_iam_policy.AWSLoadBalancerController.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${var.sa_namespace}:${var.iam_alb_role_name}"]

  depends_on = [aws_iam_policy.AWSLoadBalancerController]
}



