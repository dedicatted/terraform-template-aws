variable "cluster_name" {
  default     = "TestCluster"
  description = "Your Kubernetes Cluster Name"
}

variable "vpc_name" {
  default     = "TestVPC"
  description = "Your VPC Name"
}

variable "cluster_version" {
  default     = "1.19"
  description = "Kubernetes Version"
}

variable "aws_region" {
  default     = "eu-west-1"
  description = "Your AWS Region"
}

variable "aws_secret_access_key" {
  default     = ""
  description = "Your AWS secret access key"
}

variable "aws_secret_shared_key" {
  default     = ""
  description = "Your AWS secret shared key"
}

variable "kub_user_arn" {
  default     = ""
  description = "AWS User ARN"
}

variable "kub_user_name" {
  default     = ""
  description = "AWS Account Name"
}

variable "kub_groups" {
  default     = "system:masters"
  description = "User Groups"
}

variable "kub_instance_type" {
  default      = "t2.medium"
  description = "Instalnce's type of Kubernetes Nodes"
}

variable "kub_asg_max_size" {
  type        = number
  default     = 1
  description = "Auto-Scaling group max size"
}

variable "kub_asg_min_size" {
  type        = number
  default     = 1
  description = "Auto-Scaling group min size"
}

variable "kub_irsa_enable" {
  default     = true
  description = "True or False to enable or disable IRSA"
}

variable "service_account_namespace" {
  default     = "kube-system"
  description = "Your namespace for Service Account in Kubernetes"
}

variable "helm_albc_timeout" {
  type        = number
  default     = 400
  description = "Max timeout value for Helm chart AWS ALB Controller"
}

variable "alb_controller_name" {
  default     = "aws-load-balancer-controller"
  description = "Default name for ALB Controller role, etc."
}
