variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable/Disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable/Disable DNS hostnames in the VPC"
}

variable "common_tags" {
  type        = map(string)
  description = "Map of tags to assign to ALL resources"
}

variable "vpc_tags" {
  type        = map(string)
  description = "Map of tags to assign to VPC resource"
}

variable "vpc_resource_prefix" {
  type        = string
  description = "Prefix for VPC"
}

variable "environment_name" {
  type        = string
  description = "Name of the current environment - dev, prod, etc."
}

variable "enable_dhcp_options" {
  type        = string
  description = "Enable DHCP options"
}

variable "dhcp_options_domain_name" {
  type        = string
  description = "Suffix domain name to use by default when resolving non Fully Qualified Domain Names. The search value in the /etc/resolv.conf "
}

variable "dhcp_options_domain_name_servers" {
  type        = list(string)
  description = "List of name servers to configure in /etc/resolv.conf. To use default AWS nameservers, set to AmazonProvidedDNS"
}

variable "dhcp_options_ntp_servers" {
  type        = list(string)
  description = "NTP servers"
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
  description = "Prefix for subnet"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of VPC private subnets to create"
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Map of tags to assign to public subnets"
}

variable "public_subnet_tier_name" {
  type        = string
  description = "The tier name convention for public subnet object"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of VPC private subnets to create "
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Map of tags to assign to private subnets"
}

variable "eks_cluster_resource_prefix" {
  type        = string
  description = "Prefix for EKS Cluster object"
}

variable "eks_cluster_tier_name" {
  type        = string
  description = "The tier name convention for EKS Cluster object"
}

variable "private_subnet_tier_name" {
  type        = string
  description = "The tier name convention for private subnet object."
}

variable "data_subnets" {
  type        = list(string)
  description = "List of VPC data subnets to create"
}

variable "data_subnet_tags" {
  type        = map(string)
  description = "AMap of tags to assign to data subnets"
}

variable "data_subnet_tier_name" {
  type        = string
  description = "The tier name convention for data subnet object"
}

variable "db_subnet_group_resource_prefix" {
  type        = string
  description = "Prefix for DB subnet group object"
}

variable "db_subnet_group_tags" {
  type        = map(string)
  description = "Map of tags to assign to DB subnet group"
}

variable "default_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps, of INGRESS rules to set on the default Network ACL"
}

variable "default_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps, of EGRESS rules to set on the default Network ACL"
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
  description = "The tier name convention for default Network ACL object"
}

variable "public_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps, of INGRESS rules to set on the Public Network ACL"
}

variable "public_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps, of EGRESS rules to set on the Public Network ACL"
}

variable "public_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to Public Network ACL."
}

variable "private_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps, of INGRESS rules to set on the Private Network ACL"
}

variable "private_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps, of EGRESS rules to set on the Private Network ACL"
}

variable "private_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to Private Network ACL"
}

variable "data_network_acl_ingress_rules" {
  type        = list(map(string))
  description = "List of maps, of INGRESS rules to set on the Data Network ACL"
}

variable "data_network_acl_egress_rules" {
  type        = list(map(string))
  description = "List of maps, of EGRESS rules to set on the Data Network ACL"
}

variable "data_network_acl_tags" {
  type        = map(string)
  description = "Map of tags to assign to Data Network ACL"
}

variable "internet_gateway_tags" {
  type        = map(string)
  description = "Map of tags to assign to Internet Gateway"
}

variable "internet_gateway_resource_prefix" {
  type        = string
  description = "Prefix for Internet Gateway"
}

variable "eip_tags" {
  type        = map(string)
  description = "Map of tags to assign to NAT Elastic IP"
}

variable "nat_eip_resource_prefix" {
  type        = string
  description = "Prefix for NAT Elastic IP"
}

variable "nat_eip_tier_name" {
  type        = string
  description = "The tier name convention for NAT Elastic IP"
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
