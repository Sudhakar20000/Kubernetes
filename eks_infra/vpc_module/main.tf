resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge (
    var.vpc_tag,
    local.common_tags
  )
  
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge (
    local.common_tags,
    var.igw_tags
  )
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = local.available_zones[count.index]
  cidr_block        = var.public_subnet_cidr[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    var.public_subnet_tags,
    {
        Name = "${local.common_name}-public-${split("-",local.availability_zone[count.index])[2]}"  }
  )
}

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = local.available_zones[count.index]
  cidr_block        = var.private_subnet_cidr[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.private_subnet_tags,
    local.common_tags,
    {
        Name = "${local.common_name}-private-${split("-",local.availability_zone[count.index])[2]}"  }
  )
}

resource "aws_subnet" "db_subnet" {
  count = length(var.db_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  availability_zone = local.available_zones[count.index]
  cidr_block        = var.db_subnet_cidr[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.db_subnet_tags,
    local.common_tags,
    {
        Name = "${local.common_name}-db-${split("-",local.availability_zone[count.index])[2]}"  }
  )
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge {
    Name = "empty-route-table"
  }
}

