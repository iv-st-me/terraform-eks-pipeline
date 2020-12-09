# VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.vpc_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}

resource "aws_vpc_dhcp_options" "this" {
  count = var.enable_dhcp_options ? 1 : 0

  domain_name         = var.dhcp_options_domain_name
  domain_name_servers = var.dhcp_options_domain_name_servers
  ntp_servers         = var.dhcp_options_ntp_servers

  tags = merge(
    var.common_tags,
    var.dhcp_options_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.dhcp_options_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}

resource "aws_vpc_dhcp_options_association" "this" {
  count = var.enable_dhcp_options ? 1 : 0

  vpc_id          = aws_vpc.this.id
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
}


# Public Subnet
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = merge(
    var.common_tags,
    var.public_subnet_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.subnet_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.public_subnet_tier_name),
      )
    },
  )
}

# Private Subnet
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnets, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(
    var.common_tags,
    var.private_subnet_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.subnet_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.private_subnet_tier_name),
      ),
      "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
    },
  )
}

# Data Subnet

resource "aws_subnet" "data" {
  count = length(var.data_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.data_subnets, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(
    var.common_tags,
    var.data_subnet_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.subnet_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.data_subnet_tier_name),
      )
    },
  )
}

resource "aws_db_subnet_group" "this" {
  count      = length(var.data_subnets)
  subnet_ids = aws_subnet.data.*.id
  name = format(
    "%s-%s-%s-%s",
    lower(var.db_subnet_group_resource_prefix),
    join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
    lower(var.environment_name),
    lower(var.data_subnet_tier_name),
  )

  tags = merge(
    var.common_tags,
    var.db_subnet_group_tags,
  )
}

# Default Network ACL

resource "aws_default_network_acl" "this" {
  default_network_acl_id = aws_vpc.this.default_network_acl_id

  dynamic "ingress" {
    for_each = var.default_network_acl_ingress_rules
    content {
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      protocol   = ingress.value.protocol
      icmp_code  = lookup(ingress.value, "icmp_code", null)
      icmp_type  = lookup(ingress.value, "icmp_type", null)
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.default_network_acl_egress_rules
    content {
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      protocol   = egress.value.protocol
      icmp_code  = lookup(egress.value, "icmp_code", null)
      icmp_type  = lookup(egress.value, "icmp_type", null)
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.default_network_acl_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.network_acl_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.default_network_acl_tier_name),
      )
    },
  )
}


# Public Network ACL
resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.public.*.id

  dynamic "ingress" {
    for_each = var.public_network_acl_ingress_rules
    content {
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      protocol   = ingress.value.protocol
      icmp_code  = lookup(ingress.value, "icmp_code", null)
      icmp_type  = lookup(ingress.value, "icmp_type", null)
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.public_network_acl_egress_rules
    content {
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      protocol   = egress.value.protocol
      icmp_code  = lookup(egress.value, "icmp_code", null)
      icmp_type  = lookup(egress.value, "icmp_type", null)
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.public_network_acl_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.network_acl_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.public_subnet_tier_name),
      )
    },
  )
}

# Private Network ACL

resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private.*.id

  dynamic "ingress" {
    for_each = var.private_network_acl_ingress_rules
    content {
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      protocol   = ingress.value.protocol
      icmp_code  = lookup(ingress.value, "icmp_code", null)
      icmp_type  = lookup(ingress.value, "icmp_type", null)
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.private_network_acl_egress_rules
    content {
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      protocol   = egress.value.protocol
      icmp_code  = lookup(egress.value, "icmp_code", null)
      icmp_type  = lookup(egress.value, "icmp_type", null)
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.private_network_acl_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.network_acl_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.private_subnet_tier_name),
      )
    },
  )
}


# Data Network ACL

resource "aws_network_acl" "data" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.data.*.id

  dynamic "ingress" {
    for_each = var.data_network_acl_ingress_rules
    content {
      rule_no    = ingress.value.rule_no
      action     = ingress.value.action
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
      protocol   = ingress.value.protocol
      icmp_code  = lookup(ingress.value, "icmp_code", null)
      icmp_type  = lookup(ingress.value, "icmp_type", null)
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.data_network_acl_egress_rules
    content {
      rule_no    = egress.value.rule_no
      action     = egress.value.action
      from_port  = egress.value.from_port
      to_port    = egress.value.to_port
      protocol   = egress.value.protocol
      icmp_code  = lookup(egress.value, "icmp_code", null)
      icmp_type  = lookup(egress.value, "icmp_type", null)
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }

  tags = merge(
    var.common_tags,
    var.data_network_acl_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.network_acl_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.data_subnet_tier_name),
      )
    },
  )
}

# Public Internet Gateway

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    var.internet_gateway_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.internet_gateway_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
      )
    },
  )
}

# NAT Gateway

resource "aws_eip" "nat" {
  count = length(var.public_subnets)

  vpc = local.eip_in_vpc

  tags = merge(
    var.common_tags,
    var.eip_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.nat_eip_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.nat_eip_tier_name),
      )
    },
  )
}

resource "aws_nat_gateway" "this" {
  count = length(var.public_subnets)

  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
      "Name" = format(
        "%s-%s-%s",
        lower(var.nat_gateway_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
      )
    },
  )

  depends_on = [aws_internet_gateway.this]
}

# Public Subnet Route Table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    var.route_table_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.route_table_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", data.aws_region.current.name)),
        lower(var.environment_name),
        lower(var.public_subnet_tier_name),
      )
    },
  )
}

resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = local.default_ipv4_route
  gateway_id             = aws_internet_gateway.this.id

  timeouts {
    create = "3m"
  }
}

# Private Subnet Route Table

resource "aws_route_table" "private" {
  count = length(var.private_subnets)

  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    var.route_table_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.route_table_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.private_subnet_tier_name),
      )
    },
  )
}

resource "aws_route" "private_nat_gateway" {
  count = length(var.private_subnets)

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = local.default_ipv4_route
  nat_gateway_id         = element(aws_nat_gateway.this.*.id, count.index)

  timeouts {
    create = "3m"
  }
}

# Data Subnet Route Table

resource "aws_route_table" "data" {
  count = length(var.data_subnets)

  vpc_id = aws_vpc.this.id

  tags = merge(
    var.common_tags,
    var.route_table_tags,
    {
      "Name" = format(
        "%s-%s-%s-%s",
        lower(var.route_table_resource_prefix),
        join("", regex("(^.)?\\D-(\\D)?[a-z]*-(.*$)", element(data.aws_availability_zones.available.names, count.index))),
        lower(var.environment_name),
        lower(var.data_subnet_tier_name),
      )
    },
  )
}

resource "aws_route" "nat_gateway" {
  count = length(var.data_subnets)

  route_table_id         = element(aws_route_table.data.*.id, count.index)
  destination_cidr_block = local.default_ipv4_route
  nat_gateway_id         = element(aws_nat_gateway.this.*.id, count.index)

  timeouts {
    create = "5m"
  }
}


# Each Route table to each Subnet association

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

resource "aws_route_table_association" "data" {
  count = length(var.data_subnets)

  subnet_id      = element(aws_subnet.data.*.id, count.index)
  route_table_id = element(aws_route_table.data.*.id, count.index)
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnets)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}
