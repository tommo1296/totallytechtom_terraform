resource "aws_vpc" "tutorial" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_subnet" "tutorial" {
  vpc_id     = aws_vpc.tutorial.id
  cidr_block = "10.0.0.0/24"

  map_public_ip_on_launch = true

  tags = {
    Name        = "public-${var.name}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "tutorial" {
  vpc_id = aws_vpc.tutorial.id

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_route_table" "tutorial" {
  vpc_id = aws_vpc.tutorial.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tutorial.id
  }

  tags = {
    Name        = "public-${var.name}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "tutorial" {
  subnet_id      = aws_subnet.tutorial.id
  route_table_id = aws_route_table.tutorial.id
}
