variable "common_region" {
  type        = string
  description = "Region where to create resources"
}

variable "organizations_shared_account_id" {
  type        = string
  description = "Organizations Account ID for the Shared Services account"
}

variable "vpc_tags" {
  type        = map(string)
  description = "Map of tags to assign to vpc resource"
}

variable "vpc_resource_prefix" {
  type        = string
  description = "Prefix for vpc object"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to all resources"
}

variable "dhcp_options_tags" {
  type        = map(string)
  description = "Map of tags to assign to dhcp option resource"
}

variable "dhcp_options_resource_prefix" {
  type        = string
  description = "Prefix for dhcp options object"
}

variable "subnet_resource_prefix" {
  type        = string
  description = "Prefix for subnet object"
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Map of tags to assign to public subnets"
}

variable "public_subnet_tier_name" {
  type        = string
  description = "Tier name for public subnet object"
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Map of tags to assign to private subnets"
}

variable "private_subnet_tier_name" {
  type        = string
  description = "Tier name for private subnet object"
}

variable "eks_cluster_resource_prefix" {
  type        = string
  description = "Prefix for EKS Cluster object"
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "Tier name convention for EKS Cluster object"
}

variable "data_subnet_tags" {
  type        = map(string)
  description = "Map of tags to assign to data subnets"
}

variable "data_subnet_tier_name" {
  type        = string
  description = "Tier name convention for data subnet object"
}

variable "db_subnet_group_resource_prefix" {
  type        = string
  description = "Prefix for DB subnet group object"
}

variable "db_subnet_group_tags" {
  type        = map(string)
  description = "Map of tags to assign to DB subnet group"
}

variable "default_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to default Network ACL"
}

variable "network_acl_resource_prefix" {
  type        = string
  description = "Prefix for Network ACL object"
}

variable "default_network_acl_tier_name" {
  type        = string
  description = "Tier name for default Network ACL object"
}

variable "public_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to public Network ACL"
}

variable "private_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to private Network ACL"
}

variable "data_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to data Network ACL"
}

variable "internet_gateway_tags" {
  type        = map(string)
  description = "Map of tags to assign to Internet Gateway object"
}

variable "internet_gateway_resource_prefix" {
  type        = string
  description = "Prefix for Internet Gateway object"
}

variable "eip_tags" {
  type        = map(string)
  description = "Map of tags to assign to NAT Elastic IP object"
}

variable "nat_eip_resource_prefix" {
  type        = string
  description = "Prefox for NAT Elastic IP object."
}

variable "nat_eip_tier_name" {
  type        = string
  description = "Tier name for NAT Elastic IP"
}

variable "nat_gateway_tags" {
  type        = map(string)
  description = "Map of tags to assign to NAT Gateway"
}

variable "nat_gateway_resource_prefix" {
  type        = string
  description = "Prefix for NAT Gateway"
}

variable "route_table_tags" {
  type        = map(string)
  description = "Map of tags to assign to Route Table"
}

variable "route_table_resource_prefix" {
  type        = string
  description = "Prefix for Route Table"
}

variable "shared_account_environment_name" {
  type        = string
  description = "Name of the Shared environment"
}

variable "shared_account_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "shared_account_enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC: true/false"
}

variable "shared_account_enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC: true/false"
}

variable "shared_account_enable_dhcp_options" {
  type        = string
  description = "DHCP Options for the VPC"
}

variable "shared_account_dhcp_options_domain_name" {
  type        = string
  description = "Suffix domain name to use by default when resolving non FQDNs. That is search value in the /etc/resolv.conf"
}

variable "shared_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. To use default AWS nameservers set this to AmazonProvidedDNS"
}

variable "shared_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure"
}

variable "shared_account_public_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create in public subnet"
}

variable "shared_account_private_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create in private subnet"
}

variable "shared_account_data_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create in data subnet"
}

variable "shared_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for default Network ACL"
}

variable "shared_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for default Network ACL"
}

variable "shared_account_public_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for public Network ACL"
}

variable "shared_account_public_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for public Network ACL"
}

variable "shared_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for private Network ACL"
}

variable "shared_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for private Network ACL"
}

variable "shared_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for data Network ACL"
}

variable "shared_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for data Network ACL"
}

variable "dev_account_environment_name" {
  type        = string
  description = "Reference name of Development environment"
}

variable "dev_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "dev_account_enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC: true/false"
}

variable "dev_account_enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC: true/false"
}

variable "dev_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "dev_account_dhcp_options_domain_name" {
  type        = string
  description = "Suffix domain name to use by default when resolving non FQDNs. That is search value in the /etc/resolv.conf"
}

variable "dev_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. To use default AWS nameservers set this to AmazonProvidedDNS"
}

variable "dev_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure"
}

variable "dev_account_public_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create public subnet"
}

variable "dev_account_private_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create private subnet"
}

variable "dev_account_data_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create data subnet"
}

variable "dev_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for default Network ACL"
}

variable "dev_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for default Network ACL"
}

variable "dev_account_public_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for public Network ACL"
}

variable "dev_account_public_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for public Network ACL"
}

variable "dev_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for private Network ACL"
}

variable "dev_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for private Network ACL"
}

variable "dev_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for data Network ACL"
}

variable "dev_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for data Network ACL"
}

variable "stg_account_environment_name" {
  type        = string
  description = "Reference name of Staging environment"
}

variable "stg_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "stg_account_enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC: true/false"
}

variable "stg_account_enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC: true/false"
}

variable "stg_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "stg_account_dhcp_options_domain_name" {
  type        = string
  description = "Suffix domain name to use by default when resolving non FQDNs. That is search value in the /etc/resolv.conf"
}

variable "stg_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. To use default AWS nameservers set this to AmazonProvidedDNS"
}

variable "stg_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure"
}

variable "stg_account_public_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create in public subnet"
}

variable "stg_account_private_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create private subnet"
}

variable "stg_account_data_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create data subnet"
}

variable "stg_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for default Network ACL"
}

variable "stg_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for default Network ACL"
}

variable "stg_account_public_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for public Network ACL"
}

variable "stg_account_public_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for public Network ACL"
}

variable "stg_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for private Network ACL"
}

variable "stg_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for private Network ACL"
}

variable "stg_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for data Network ACL"
}

variable "stg_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for data Network ACL"
}

variable "prod_account_environment_name" {
  type        = string
  description = "Reference name of Production environment"
}

variable "prod_account_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "prod_account_enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC: true/false"
}

variable "prod_account_enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC: true/false"
}

variable "prod_account_enable_dhcp_options" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "prod_account_dhcp_options_domain_name" {
  type        = string
  description = "Suffix domain name to use by default when resolving non FQDNs. That is search value in the /etc/resolv.conf"
}

variable "prod_account_dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. To use default AWS nameservers set this to AmazonProvidedDNS"
}

variable "prod_account_dhcp_options_ntp_servers" {
  type        = list(string)
  description = "List of NTP servers to configure"
}

variable "prod_account_public_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create public subnet"
}

variable "prod_account_private_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create private subnet"
}

variable "prod_account_data_subnets" {
  type        = list(string)
  description = "List of VPC subnet CIDRs to create data subnet"
}

variable "prod_account_default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for default Network ACL"
}

variable "prod_account_default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for default Network ACL"
}

variable "prod_account_public_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for public Network ACL"
}

variable "prod_account_public_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for public Network ACL"
}

variable "prod_account_private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for private Network ACL"
}

variable "prod_account_private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for private Network ACL"
}

variable "prod_account_data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps of ingress rules to set for data Network ACL"
}

variable "prod_account_data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps of egress rules to set for data Network ACL"
}
