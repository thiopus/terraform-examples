data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  vpc_cidr = "10.1.0.0/16"
}

# VPC, subnets and route tables
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.14.0"

  cidr            = local.vpc_cidr
  name            = "${var.environment}-vpc"
  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 3)]

  database_subnets                   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 6)]
  create_database_subnet_group       = true
  create_database_subnet_route_table = true

#  enable_nat_gateway     = true
#  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true
}
