terraform {
  required_version = "~> 1.0"
}

provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
}


data "aws_caller_identity" "current" {}

module "vpc" {
  source     = "./module/vpc"
  cidr_block = "20.0.0.0/16"
  tags       = "dev"

}

module "subnet" {
  source = "./module/subnet"
  vpc_id = module.vpc.vpc_id
  subnet_range = "20.0.0.0/24"
  tags = "dev"
}


module "igw" {
  source = "./module/igw"
  vpc_id = module.vpc.vpc_id

  tags = "dev2"
}


