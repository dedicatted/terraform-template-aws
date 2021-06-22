module "kubernetes-aws-template" {
  source = "./kubernetes-aws-template"
  aws_region           = "eu-west-1"
  kubernetes_version   = "1.19"
  vpc_name             = "TestVPC"
  cluster_name         = "TestCluster"
  irsa_enable          = true
  sa_namespace         = "kube-system"
  iam_user_name        = "george"
  iam_user_arn         = "arn:aws:iam::609478623517:user/george"
  kub_irsa_enable      = true
  kub_instance_type    = "t2.medium"
  kub_asg_min_size     = 1
  kub_asg_max_size     = 1

  install_2048_game    = true # Default value is "true"

}