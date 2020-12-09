
# Organization
organizations_shared_account_id = "235297331187"
# organizations_dev_account_id    = ""
# organizations_stg_account_id    = ""
# organizations_prod_account_id   = ""
# organizations_ou_myteam_id = ""

# Global
common_region       = "eu-central-1"
vpc_tags            = {}
vpc_resource_prefix = "vpcqa"
common_tags = {
  Terraform = "true",
  Team      = "myteam"
}
dhcp_options_tags                = {}
dhcp_options_resource_prefix     = "dpo"
subnet_resource_prefix           = "netqa"
public_subnet_tags               = {}
public_subnet_tier_name          = "public"
private_subnet_tags              = {}
private_subnet_tier_name         = "private"
eks_cluster_resource_prefix      = "eksqa"
eks_cluster_tier_name            = "" #=eks_master_tier_name
data_subnet_tags                 = {}
data_subnet_tier_name            = "data"
db_subnet_group_resource_prefix  = "sngqa"
db_subnet_group_tags             = {}
default_network_acl_tags         = {}
network_acl_resource_prefix      = "naclqa"
default_network_acl_tier_name    = "default"
public_network_acl_tags          = {}
private_network_acl_tags         = {}
data_network_acl_tags            = {}
internet_gateway_tags            = {}
internet_gateway_resource_prefix = "igwqa"
eip_tags                         = {}
nat_eip_resource_prefix          = "eipqa"
nat_eip_tier_name                = "public"
nat_gateway_tags                 = {}
nat_gateway_resource_prefix      = "ngwqa"
route_table_tags                 = {}
route_table_resource_prefix      = "rtbqa"

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
shared_account_data_subnets                     = ["10.10.111.0/24", "10.10.112.0/24", "10.10.113.0/24"]
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

# Development Account Network
dev_account_environment_name                 = "dev"
dev_account_cidr_block                       = "10.0.0.0/16"
dev_account_enable_dns_support               = true
dev_account_enable_dns_hostnames             = true
dev_account_enable_dhcp_options              = false
dev_account_dhcp_options_domain_name         = ""
dev_account_dhcp_options_domain_name_servers = []
dev_account_dhcp_options_ntp_servers         = []
dev_account_public_subnets                   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
dev_account_private_subnets                  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
dev_account_data_subnets                     = ["10.0.111.0/24", "10.0.112.0/24", "10.0.113.0/24"]
dev_account_default_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_default_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_public_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_public_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_private_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_private_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_data_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
dev_account_data_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]


# Staging Account Network

stg_account_environment_name                 = "stg"
stg_account_cidr_block                       = "10.1.0.0/16"
stg_account_enable_dns_support               = true
stg_account_enable_dns_hostnames             = true
stg_account_enable_dhcp_options              = false
stg_account_dhcp_options_domain_name         = ""
stg_account_dhcp_options_domain_name_servers = []
stg_account_dhcp_options_ntp_servers         = []
stg_account_public_subnets                   = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
stg_account_private_subnets                  = ["10.1.11.0/24", "10.1.12.0/24", "10.1.13.0/24"]
stg_account_data_subnets                     = ["10.1.111.0/24", "10.1.112.0/24", "10.1.113.0/24"]
stg_account_default_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_default_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_public_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_public_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_private_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_private_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_data_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
stg_account_data_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]

########################################################
# Production Account Network
########################################################
prod_account_environment_name                 = "prod"
prod_account_cidr_block                       = "10.2.0.0/16"
prod_account_enable_dns_support               = true
prod_account_enable_dns_hostnames             = true
prod_account_enable_dhcp_options              = false
prod_account_dhcp_options_domain_name         = ""
prod_account_dhcp_options_domain_name_servers = []
prod_account_dhcp_options_ntp_servers         = []
prod_account_public_subnets                   = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
prod_account_private_subnets                  = ["10.2.11.0/24", "10.2.12.0/24", "10.2.13.0/24"]
prod_account_data_subnets                     = ["10.2.111.0/24", "10.2.112.0/24", "10.2.113.0/24"]
prod_account_default_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_default_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_public_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_public_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_private_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_private_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_data_network_acl_ingress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
prod_account_data_network_acl_egress_rules = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
]
