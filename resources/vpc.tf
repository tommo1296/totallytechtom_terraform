resource "aws_vpc" "tutorial" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true

  tags = {
    Name = "vpc-tutorial"
  }
}

resource "aws_subnet" "tutorial" {
  vpc_id     = aws_vpc.tutorial.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "tutorial"
  }
}
