variable "region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type = string

}

variable "cluster_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "availability_zone_name" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}