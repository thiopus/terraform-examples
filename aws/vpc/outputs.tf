output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}


output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}


output "private_subnets" {
  description = "A list of private subnets inside the VPC"
  value       = module.vpc.private_subnets
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks
}


output "public_subnets" {
  description = "A list of public subnets inside the VPC"
  value       = module.vpc.public_subnets
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.vpc.public_subnets_cidr_blocks
}


output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}


output "azs" {
  description = "A list of availability zones specified as argument to this module"
  value       = module.vpc.azs
}


output "database_subnet_group" {
  description = "ID of database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_group_name" {
  description = "Name of database subnet group"
  value       = module.vpc.database_subnet_group_name
}

output "database_subnets" {
  description = "List of IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks
}

# VPC endpoints
output "vpc_endpoints" {
  description = "Array containing the full resource object and attributes for all endpoints created"
  value       = module.vpc_endpoints.endpoints
}

output "vpc_endpoints_security_group_arn" {
  description = "Amazon Resource Name (ARN) of the security group"
  value       = module.vpc_endpoints.security_group_arn
}

output "vpc_endpoints_security_group_id" {
  description = "ID of the security group"
  value       = module.vpc_endpoints.security_group_id
}
