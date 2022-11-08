# Create green VPC for weather app build
resource "aws_vpc" "green_vpc" {
  cidr_block           = var.vpc_cidr # CIDR block as per project instructions
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"


  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenvpc"
    }
  )
}

#==== Availability Zones ======#

data "aws_availability_zones" "green_available" {
  all_availability_zones = true
}

#==== Public Subnets ======#

resource "aws_subnet" "green_pubic_subnet" {
  vpc_id                  = aws_vpc.green_vpc.id # attaching subnet to above VPC
  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.green_vpc.cidr_block, var.public_subnet_cidr_bits, count.index) # CIDR block as per project instruction
  availability_zone       = data.aws_availability_zones.green_available.names[count.index]                     # explain which availability zone to use for creating subnet
  map_public_ip_on_launch = true                                                                               # make this a public subnet. set to "false" if private subnet is needed

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenpublic-${count.index}"
      tier = "public"
    }
  )
}

#==== Internet gateway for the public subnets ======#

resource "aws_internet_gateway" "green_igw" {
  vpc_id = aws_vpc.green_vpc.id

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenigw"
    }
  )
}

#====== Routing table for public subnets ======#

resource "aws_route_table" "green_public_rt" {
  vpc_id = aws_vpc.green_vpc.id # create route table in above VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.green_igw.id # creating route entry for internet gateway 
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenpubrt"
    }
  )
}

#====== Associate public route tables to public subnets =======#
resource "aws_route_table_association" "green_public" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.green_pubic_subnet.*.id, count.index)
  route_table_id = aws_route_table.green_public_rt.id
}

#==== Private Subnets ======#

# Resource block for private subnet a
resource "aws_subnet" "green_private_subnet" {
  vpc_id                  = aws_vpc.green_vpc.id # attaching subnet to above VPC
  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.green_vpc.cidr_block, var.private_subnet_cidr_bits, count.index + var.az_count) # CIDR block as per project instruction
  availability_zone       = data.aws_availability_zones.green_available.names[count.index]                                     # explain which availability zone to use for creating subnet
  map_public_ip_on_launch = false

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenprivate-${count.index}"
      tier = "private"
    }
  )
}

#====== Elastic IP for NAT Gateway ======#

resource "aws_eip" "green_eip" {
  vpc = true

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greeneip"
    }
  )
}


#====== Create NAT Gateways ======#

resource "aws_nat_gateway" "green_nat" {
  allocation_id = aws_eip.green_eip.id                           # attaching eip-a to this NAT gateway
  subnet_id     = element(aws_subnet.green_pubic_subnet.*.id, 0) # placing this NAT gateway in public subnet "public-a" subnet
  depends_on = [
    aws_eip.green_eip # ensuring that Elastic IP is created before NAT gateway
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greennat"
    }
  )
}

#====== Route table for private subnets ======#


resource "aws_route_table" "green_private_rt" {
  vpc_id = aws_vpc.green_vpc.id # ensuring Route table is created for this VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.green_nat.id # creating route entry for nat gateway 
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.name}-greenprivrt"
    }
  )
}

#====== Associate public route tables to public subnets =======#

resource "aws_route_table_association" "green_private" {
  count          = var.az_count
  subnet_id      = element(aws_subnet.green_private_subnet.*.id, count.index) # target private subnet
  route_table_id = aws_route_table.green_private_rt.id                        # associate with route table private-a
}
