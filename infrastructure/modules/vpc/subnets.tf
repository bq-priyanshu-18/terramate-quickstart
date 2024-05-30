##########################################################################
# Public Subnet
##########################################################################

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets[count.index].cidr
  availability_zone       = var.public_subnets[count.index].availability_zones 
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_subnets[count.index].name
  }
}

##########################################################################
# Private Subnet
##########################################################################

resource "aws_subnet" "private_subnet" {
  count = length(var.private_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets[count.index].cidr
  availability_zone       = var.private_subnets[count.index].availability_zones
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnets[count.index].name
  }
}
