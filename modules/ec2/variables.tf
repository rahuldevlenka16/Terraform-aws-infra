# modules/ec2/variables.tf

variable "instance_count" {
  type    = number
  default = 2
}

variable "ami" {
  type = string
  default     = "ami-05c179eced2eb9b5b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}
