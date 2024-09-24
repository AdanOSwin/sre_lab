resource "aws_security_group" "sre_group" {
  name        = "allow_connection"
  description = "allow connection between pods"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "allow http"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    name = "allow_all"
  }
}