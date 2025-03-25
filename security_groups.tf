# Security Group for ALB (Allows HTTP)
resource "aws_security_group" "alb_sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "alb-security-group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Uncomment the following block if you want to allow HTTPS too
  # ingress {
  #   from_port   = 443
  #   to_port     = 443
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB Security Group"
  }
}

# Security Group for EC2 Instances (Allows HTTP from ALB and SSH for management)
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.my_vpc.id
  name   = "ec2-security-group"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    # security_groups = [aws_security_group.alb_sg.id]
    cidr_blocks = ["0.0.0.0/0"]
  }

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
}
