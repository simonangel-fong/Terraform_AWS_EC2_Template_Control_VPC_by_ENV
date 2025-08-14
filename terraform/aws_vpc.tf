# ##############################
# VPC: prod
# ##############################
module "vpc-prod" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "vpc-prod"
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}d"]
  private_subnets = var.private_subnet_list
  public_subnets  = var.public_subnet_list

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Name        = "vpc-prod"
    Terraform   = "true"
    Environment = "prod"
  }
}

# ##############################
# VPC: dev
# ##############################
module "vpc-dev" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = "vpc-dev"
  cidr = var.vpc_cidr

  azs                = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}d"]
  private_subnets    = var.private_subnet_list
  public_subnets     = var.public_subnet_list
  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Name        = "vpc-dev"
    Terraform   = "true"
    Environment = "dev"
  }
}
