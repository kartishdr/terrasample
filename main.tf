terraform {
  required_version = "~> 0.12.7"

  backend "s3"{
    bucket = "hemtfstate"
    key = "terra/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "tabletfstate"
    encrypt = true
  }
}

provider "aws" {
  version = "~> 3.0"
  region  = "us-east-1"
}

data "aws_caller_identity" "current" {}

module "vpc" {
  source     = "./module/vpc"
  cidr_block = "20.0.0.0/16"
  tags       = "Dev"
}

module "vpc2" {
source     = "./module/vpc"
  cidr_block = "30.0.0.0/16"
  tags       = "Dev-test"
}

module "subnet" {
 source     = "./module/subnet"
 vpc_id     = module.vpc.vpcid
 subnet_range = "20.0.0.0/24"
 tags = "Dev"
}
