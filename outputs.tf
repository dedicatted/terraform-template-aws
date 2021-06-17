output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "Private subnets list"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "Public subnets list"
}

output "aws_region" {
  value       = data.aws_region.current
  description = "AWS current Region"
}

output "kubernetes_cluster_name" {
  value       = module.kubcluster.cluster_id
  description = "Kubernetes Cluster name"
}