# Create EC2 Instances (Backend Servers)
resource "aws_instance" "my_instance" {
  count                  = 2
  ami                    = "ami-05c179eced2eb9b5b" # Replace with an appropriate AMI if needed
  instance_type          = "t2.micro"
  subnet_id              = count.index == 0 ? aws_subnet.public_subnet_1.id : aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Hello from $(hostname)</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "Backend-Instance-${count.index}"
  }
}

# Attach EC2 Instances to Target Group
resource "aws_lb_target_group_attachment" "attach_instances" {
  count            = 2
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = aws_instance.my_instance[count.index].id
  port             = 80
}
