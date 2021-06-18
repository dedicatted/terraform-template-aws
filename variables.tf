########################
#### Variables       ###
########################

variable "aws_secret_access_key" {
  default     = ""
  description = "Your AWS secret access key"
}

variable "aws_secret_shared_key" {
  default     = ""
  description = "Your AWS secret shared key"
}

variable "cluster_name" {
  default     = "TestCluster"
  description = "Your Kubernetes Cluster Name"
}

variable "aws_kub_version" {
  type = string
  default = "1.19"
  description = "Define your Kubernetes Version (default is 1.19)"
}

variable "irsa_enable" {
  default = true
  description = "Choose between True (yes) or False (not) "
}

variable "user_iam_name" {
  default     = "george"
  description = "Your IAM user"
}

variable "user_iam_arn" {
  default     = ""
  description = "Your user IAM arn"
}

variable "alb_iam_role_name" {
  default     = "aws-load-balancer-controller"
  description = "The name for aws load balancer controller"
}




