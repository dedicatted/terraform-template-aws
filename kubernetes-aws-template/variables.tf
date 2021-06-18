variable "aws_region" {
  type        = string
  description = "Your AWS Region"
}

variable "vpc_name" {
  type        = string
  description = "Your VPC name"
}

variable "kub_irsa_enable" {
  description = "True / False"
}

variable "cluster_name" {
  default     = "TestCluster"
  description = "Your Kubernetes cluster Name"
}

variable "kub_asg_min_size" {
  description = "Kubernetes min asg size"
}

variable "kub_asg_max_size" {
  description = "Kubernetes max asg size"
}

variable "kub_groups" {
  default     = "system:masters"
  description = "Kubernetes Group"
}

variable "kub_instance_type" {
  type        = string
  description = "Your EKS workers type"
}

variable "aws_secret_access_key" {
  default     = ""
  description = "Your AWS secret access key"
}

variable "aws_secret_shared_key" {
  default     = ""
  description = "Your AWS secret shared key"
}


variable "kubernetes_version" {
  type        = string
  default     = "1.19"
  description = "Define your Kubernetes Version (default is 1.19)"
}

variable "irsa_enable" {
  type        = string
  description = "Choose between True (yes) or False (not) "
}

variable "iam_user_name" {
  type        = string
  description = "Your IAM user"
}

variable "iam_user_arn" {
  type        = string
  description = "Your user IAM arn"
}

variable "iam_alb_role_name" {
  default     = "aws-load-balancer-controller"
  description = "The name for aws load balancer controller"
}

variable "sa_namespace" {
  default     = "kube-system"
  description = "Service Account namespace"
}

variable "helm_timeout" {
  type        = number
  default     = 400
  description = "Default Helm Release timeout"
}

variable "install_2048_game" {
  type        = bool
  default     = true
  description = "Install game-2048 (1 - yes ; 0 - no)"
}




