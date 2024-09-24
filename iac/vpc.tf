module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs = var.availability_zone_name

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  create_igw = true

  enable_nat_gateway = true

  single_nat_gateway = true

  tags = {
    Terraform   = true
    Environment = "sre_lab"
  }
}