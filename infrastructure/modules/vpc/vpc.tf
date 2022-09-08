module "locals" {
  source = "../locals"
}


# Create new VPC for weather app build
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr   # CIDR block as per project instructions
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"


  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-vpc"
    }
  )
}

###########################
###  Public SUBNETS    ###
###########################

# Create 3 new public subnets
# Resource block for public subnet a
resource "aws_subnet" "pub_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.pub_cidr_a  # CIDR block as per project instruction
  availability_zone       = var.az_a    # explain which availability zone to use for creating subnet
  map_public_ip_on_launch = true    # make this a public subnet. set to "false" if private subnet is needed

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-public-a"
      tier = "public"
    }
  )
}

# Resource block for public subnet b
resource "aws_subnet" "pub_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.pub_cidr_b  # CIDR block as per project instruction
  availability_zone       = var.az_b    # explain which availability zone to use for creating subnet
  map_public_ip_on_launch = true

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-public-b"
      tier = "public"
    }
  )
}

# Resource block for public subnet c
resource "aws_subnet" "pub_subnet_c" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.pub_cidr_c  # CIDR block as per project instruction
  availability_zone       = var.az_c    # explain which availability zone to use for creating subnet
  map_public_ip_on_launch = true

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-public-c"
      tier = "public"
    }
  )
}

# Create new internet gateway that will be used by the new VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id   # attaching internet gateway to above VPC

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-igw"
    }
  )
}

# Create new route table for the public subnets. Also add internet gateway in the route table
# Route table for public subnet a
resource "aws_route_table" "pub_rt_a" {
  vpc_id = aws_vpc.vpc.id   # create route table in above VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    # creating route entry for internet gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-pubrt-a"
    }
  )
}

# Route table for public subnet b
resource "aws_route_table" "pub_rt_b" {
  vpc_id = aws_vpc.vpc.id   # create route table in above VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    # creating route entry for internet gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-pubrt-b"
    }
  )
}

# Route table for public subnet c
resource "aws_route_table" "pub_rt_c" {
  vpc_id = aws_vpc.vpc.id   # create route table in above VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    # creating route entry for internet gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-pubrt-c"
    }
  )
}


# Associate public route tables to public subnets
resource "aws_route_table_association" "pub_subnet_a" {
  subnet_id      = aws_subnet.pub_subnet_a.id
  route_table_id = aws_route_table.pub_rt_a.id
}

resource "aws_route_table_association" "pub_subnet_b" {
  subnet_id      = aws_subnet.pub_subnet_b.id
  route_table_id = aws_route_table.pub_rt_b.id
}

resource "aws_route_table_association" "pub_subnet_c" {
  subnet_id      = aws_subnet.pub_subnet_c.id
  route_table_id = aws_route_table.pub_rt_c.id
}

###########################
###  PRIVATE SUBNETS    ###
###########################

# Create 3 new private subnets
# Resource block for private subnet a
resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.private_cidr_a  # CIDR block as per project instruction
  availability_zone       = var.az_a    # explain which availability zone to use for creating subnet

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-private-a"
      tier = "private"
    }
  )
}

# Resource block for public subnet b
resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.private_cidr_b  # CIDR block as per project instruction
  availability_zone       = var.az_b    # explain which availability zone to use for creating subnet

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-private-b"
      tier = "private"
    }
  )
}

# Resource block for public subnet c
resource "aws_subnet" "private_subnet_c" {
  vpc_id                  = aws_vpc.vpc.id  # attaching subnet to above VPC
  cidr_block              = var.private_cidr_c  # CIDR block as per project instruction
  availability_zone       = var.az_c    # explain which availability zone to use for creating subnet

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-private-c"
      tier = "private"
    }
  )
}

# Create 3 Elastic IP to be used by 3 NAT gateways respectively
# Elastic IP a (to be used by NAT gateway a)
resource "aws_eip" "eip_ngw_a" {
  vpc = true

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-eip-a"
    }
  )
}
# Elastic IP B (to be used by NAT gateway B)
resource "aws_eip" "eip_ngw_b" {
  vpc = true

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-eip-b"
    }
  )
}

# Elastic IP C (to be used by NAT gateway C)
resource "aws_eip" "eip_ngw_c" {
  vpc = true

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-eip-c"
    }
  )
}

# Create 3 new NAT Gateways
# Resource block for NAT-a
resource "aws_nat_gateway" "nat_gateway_a" {
  allocation_id = aws_eip.eip_ngw_a.id        # attaching eip-a to this NAT gateway
  subnet_id     = aws_subnet.pub_subnet_a.id # placing this NAT gateway in public subnet "public-a" subnet
  depends_on = [
    aws_eip.eip_ngw_a # ensuring that Elastic IP is created before NAT gateway
  ]

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-ngw-a"
    }
  )
}

# Resource block for NAT-b
resource "aws_nat_gateway" "nat_gateway_b" {
  allocation_id = aws_eip.eip_ngw_b.id        # attaching eip-a to this NAT gateway
  subnet_id     = aws_subnet.pub_subnet_b.id # placing this NAT gateway in public subnet "public-b" subnet
  depends_on = [
    aws_eip.eip_ngw_b # ensuring that Elastic IP is created before NAT gateway
  ]

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-ngw-b"
    }
  )
}

# Resource block for NAT-c
resource "aws_nat_gateway" "nat_gateway_c" {
  allocation_id = aws_eip.eip_ngw_c.id        # attaching eip-a to this NAT gateway
  subnet_id     = aws_subnet.pub_subnet_c.id # placing this NAT gateway in public subnet "public-c" subnet
  depends_on = [
    aws_eip.eip_ngw_c # ensuring that Elastic IP is created before NAT gateway
  ]

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-ngw-c"
    }
  )
}

# Create new route tables for the private subnets. Also add NAT gateway in the route table
# Route table for private subnet a
resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.vpc.id # ensuring Route table is created for this VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_a.id # creating route entry for nat gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-privrt-a"
    }
  )
}


# Route table for private subnet b
resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.vpc.id # ensuring Route table is created for this VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_b.id # creating route entry for nat gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-privrt-b"
    }
  )
}

# Route table for private subnet c
resource "aws_route_table" "private_rt_c" {
  vpc_id = aws_vpc.vpc.id # ensuring Route table is created for this VPC

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway_c.id # creating route entry for nat gateway 
  }

  tags = merge(
    module.locals.tags,
    {
      Name = "${module.locals.name}-privrt-c"
    }
  )
}

# Associate private route tables to public subnets
resource "aws_route_table_association" "private_subnet_a" {
  subnet_id      = aws_subnet.private_subnet_a.id # target private subnet
  route_table_id = aws_route_table.private_rt_a.id # associate with route table private-a
}

resource "aws_route_table_association" "private_subnet_b" {
  subnet_id      = aws_subnet.private_subnet_b.id # target private subnet
  route_table_id = aws_route_table.private_rt_b.id # associate with route table private-b
}

resource "aws_route_table_association" "private_subnet_c" {
  subnet_id      = aws_subnet.private_subnet_c.id # target private subnet
  route_table_id = aws_route_table.private_rt_c.id # associate with route table private-c
}
