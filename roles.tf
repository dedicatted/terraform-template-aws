#############################################
### ...Creation IAM policy for ALB controller
#############################################

module "eks_iam_role" {
  source = "cloudposse/eks-iam-role/aws"

  namespace                   = "kube-system"
  name                        = "aws_lb_c"

  aws_account_number          = data.aws_caller_identity.current.account_id
  eks_cluster_oidc_issuer_url = module.kubcluster.cluster_oidc_issuer_url
  service_account_name        = var.service_account_name
  service_account_namespace   = var.service_account_namespace

  aws_iam_policy_document = file("files/loadbalancercontroller.json")

  depends_on = [module.kubcluster]
}

