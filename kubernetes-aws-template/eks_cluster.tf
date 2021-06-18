###########################################
### Kubernetes Cluster. Step 2          ###
###########################################

module "kubcluster" {
  source                          = "terraform-aws-modules/eks/aws"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.kubernetes_version
  vpc_id                          = module.vpc.vpc_id
  subnets                         = module.vpc.private_subnets
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  enable_irsa                     = var.kub_irsa_enable
  map_users = [
    {
      userarn  = var.iam_user_name
      username = var.iam_user_arn
      groups   = [var.kub_groups]
    }
  ]

  worker_groups = [
    {
      instance_type        = var.kub_instance_type
      asg_max_size         = var.kub_asg_min_size
      asg_min_size         = var.kub_asg_min_size
    }
  ]
  depends_on = [module.vpc]
}