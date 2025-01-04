resource "aws_security_group" "tutorial" {
  vpc_id = aws_vpc.tutorial.id

  name        = var.name
  description = "Allow SSH inbound traffic to the tutorial instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}

resource "aws_instance" "tutorial" {
  ami           = "ami-019374baf467d6601"
  instance_type = var.tutorial_instance_type
  subnet_id     = aws_subnet.tutorial.id

  vpc_security_group_ids = [aws_security_group.tutorial.id]

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}