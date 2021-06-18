###############################
#### Getting fresh data     ###
###############################

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_eks_cluster" "cluster" {
  name = module.kubecluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.kubecluster.cluster_id
}
data "http" "game-2048" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.1.3/docs/examples/2048/2048_full.yaml"
}

data "http" "applytargetfroupbinding" {
  url = "https://raw.githubusercontent.com/aws/eks-charts/master/stable/aws-load-balancer-controller/crds/crds.yaml"
}