###########################################
### VPC for Kubernetes Cluster. Step #1 ###
###########################################

data "aws_availability_zones" "this" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name                   = var.vpc_name
  cidr                   = "10.0.0.0/16"
  secondary_cidr_blocks  = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
  azs                    = data.aws_availability_zones.this.names
  private_subnets        = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
  public_subnets         = ["10.3.16.0/20", "10.3.32.0/20", "10.3.48.0/20"]
  enable_dns_hostnames   = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}