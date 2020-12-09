
# Organization
organizations_shared_account_id = "235297331187"


# Global
vpc_tags            = {}
vpc_resource_prefix = "vpc"
common_tags = {
  Terraform = "true",
  Team      = "myteam"
}
dhcp_options_tags                              = {}
dhcp_options_resource_prefix                   = "dpo"
subnet_resource_prefix                         = "net"
public_subnet_tags                             = {}
public_subnet_tier_name                        = "public"
private_subnet_tags                            = {}
private_subnet_tier_name                       = "private"
eks_cluster_resource_prefix                    = "eks"
eks_cluster_tier_name                          = "master"
data_subnet_tags                               = {}
data_subnet_tier_name                          = "data"
db_subnet_group_resource_prefix                = "sng"
db_subnet_group_tags                           = {}
default_network_acl_tags                       = {}
network_acl_resource_prefix                    = "nacl"
default_network_acl_tier_name                  = "default"
public_network_acl_tags                        = {}
private_network_acl_tags                       = {}
data_network_acl_tags                          = {}
internet_gateway_tags                          = {}
internet_gateway_resource_prefix               = "igw"
eip_tags                                       = {}
nat_eip_resource_prefix                        = "eip"
nat_eip_tier_name                              = "public"
nat_gateway_tags                               = {}
nat_gateway_resource_prefix                    = "ngw"
route_table_tags                               = {}
route_table_resource_prefix                    = "rtb"
transit_gateway_tags                           = {}
transit_gateway_resource_prefix                = "tgw"
transit_gateway_vpc_attachment_tags            = {}
transit_gateway_vpc_attachment_resource_prefix = "tga"
transit_gateway_route_table_tags               = {}
transit_gateway_route_table_resource_prefix    = "tgr"
ram_resource_share_tags                        = {}
ram_resource_share_resource_prefix             = "ram"

# Shared Account Network
shared_account_environment_name                 = "shared"
shared_account_cidr_block                       = "10.10.0.0/16"
shared_account_enable_dns_support               = true
shared_account_enable_dns_hostnames             = true
shared_account_enable_dhcp_options              = false
shared_account_dhcp_options_domain_name         = ""
shared_account_dhcp_options_domain_name_servers = []
shared_account_dhcp_options_ntp_servers         = []
shared_account_public_subnets                   = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
shared_account_private_subnets                  = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]
shared_account_data_subnets                     = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
shared_account_default_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_default_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_public_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_public_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_private_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_private_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_data_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
shared_account_data_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]



# Shared Account Transit Gateway
shared_account_share_transit_gateway = true
