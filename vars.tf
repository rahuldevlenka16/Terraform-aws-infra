variable ami {
  type        = string
  default     = "ami-05c179eced2eb9b5b"
  description = "free tier ami Amazon linux 2023"
}


variable instance_type{
    default = "t2.micro"
}

variable region{
    default = "ap-south-1"
}

variable profile{
    default = "rahul"
}