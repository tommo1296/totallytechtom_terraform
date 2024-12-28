resource "aws_security_group" "tutorial" {
  vpc_id      = aws_vpc.tutorial.id

  name        = "tutorial"
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
    Name = "tutorial"
  }
}

resource "aws_instance" "tutorial" {
  ami           = "ami-019374baf467d6601"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.tutorial.id

  vpc_security_group_ids = [aws_security_group.tutorial.id]

  tags = {
    Name = "tutorial"
  }
}
