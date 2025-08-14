# ##############################
# Secure group: prod
# ##############################
resource "aws_security_group" "bastion_sg_prod" {
  name   = "bastion_sg_prod"
  vpc_id = module.vpc-prod.vpc_id

  # allow incoming traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow any outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_sg_prod"
  }
}

# ##############################
# Secure group: dev
# ##############################
resource "aws_security_group" "bastion_sg_dev" {
  name   = "bastion_sg_dev"
  vpc_id = module.vpc-dev.vpc_id

  # allow incoming traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow any outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion_sg_dev"
  }
}

# ##############################
# EC2 instance
# ##############################
resource "aws_instance" "bastion_host" {
  instance_type = var.aws_ec2_type
  ami           = var.aws_ec2_ami
  key_name      = var.aws_key

  # if the ENV is prod, then use vpc-prod; Otherwise, vpc-dev
  subnet_id                   = var.ENV == "prod" ? module.vpc-prod.public_subnets[0] : module.vpc-dev.public_subnets[0]
  vpc_security_group_ids      = [var.ENV == "prod" ? aws_security_group.bastion_sg_prod.id : aws_security_group.bastion_sg_dev.id]
  associate_public_ip_address = true

  tags = {
    Name = "bastion_host"
  }
}

# ##############################
# Output
# ##############################
output "bastion_ssh" {
  value = "ssh -i terraform-ec2.pem ubuntu@${aws_instance.bastion_host.public_ip}"
}
