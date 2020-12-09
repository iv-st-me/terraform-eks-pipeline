output "shared_account_vpc_id" {
  value       = module.shared_account_vpc.vpc_id
  description = "ID of the VPC in the Shared Services account"
}

output "shared_account_vpc_arn" {
  value       = module.shared_account_vpc.vpc_arn
  description = "ARN in the Shared Services account"
}

output "shared_account_vpc_cidr_block" {
  value       = module.shared_account_vpc.vpc_cidr_block
  description = "CIDR block of the VPC in the Shared Services account"
}

output "shared_account_public_subnet_ids" {
  value       = module.shared_account_vpc.public_subnet_ids
  description = "ID list of public subnets in Shared Services account"
}

output "shared_account_public_subnet_arns" {
  value       = module.shared_account_vpc.public_subnet_arns
  description = "ARN list of public subnets in Shared Services account"
}

output "shared_account_private_subnet_ids" {
  value       = module.shared_account_vpc.private_subnet_ids
  description = "ID list of private subnets in Shared Services account"
}

output "shared_account_private_subnet_arns" {
  value       = module.shared_account_vpc.private_subnet_arns
  description = "ARN list of private subnets in Shared Services account"
}

output "shared_account_data_subnet_ids" {
  value       = module.shared_account_vpc.data_subnet_ids
  description = "ID list of data subnets in Shared Services account"
}

output "shared_account_data_subnet_arns" {
  value       = module.shared_account_vpc.data_subnet_arns
  description = "ARN list of data subnets in Shared Services account"
}
