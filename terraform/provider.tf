# ##############################
# provider
# ##############################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
  }
}

provider "aws" {
  region = var.aws_region
}