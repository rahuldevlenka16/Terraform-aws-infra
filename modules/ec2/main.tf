# modules/ec2/main.tf

resource "aws_instance" "my_instance" {
  count                  = var.instance_count
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = count.index == 0 ? var.subnet_ids[0] : var.subnet_ids[1]
  vpc_security_group_ids = [var.security_group_id]

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

resource "aws_lb_target_group_attachment" "attach_instances" {
  count            = var.instance_count
  target_group_arn = var.target_group_arn
  target_id        = aws_instance.my_instance[count.index].id
  port             = 80
}
