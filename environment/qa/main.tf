provider "aws" {
  region = "ap-south-1"
}

module "kms" {
  source      = "../../modules/kms"
  environment = "qa"
}

module "iam" {
  source      = "../../modules/iam"
  environment = "qa"
}

module "sg" {
  source      = "../../modules/security-group"
  environment = "qa"
  vpc_id      = var.vpc_id
}
