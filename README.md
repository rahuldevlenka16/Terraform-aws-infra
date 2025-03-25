# Terraform-aws-infra

terraform init 
terraform fmt 
terraform validate 
terraform plan -no-color > plan.txt # to export the text without colors in plan.txt



Experiment with this:

1. Try to make the ec2 to fetch traffic only from ALB
2. Remove the IGW and you cannot access the ec2 instance through ipv4 or even the alb dns_name 