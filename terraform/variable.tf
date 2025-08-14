# ##############################
# ENV to control VPC
# ##############################
variable "ENV" {
  default = "prod"
}

# ##############################
# Variable: AWS
# ##############################
variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet_list" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "public_subnet_list" {
  type    = list(string)
  default = ["10.0.101.0/24"]
}

variable "aws_ec2_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "aws_ec2_ami" {
  type        = string
  description = "EC2 instance image"
}

variable "aws_key" {
  description = "SSH Key Pair name"
}
