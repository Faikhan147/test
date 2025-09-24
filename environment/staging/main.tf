provider "aws" {
  region = "ap-south-1"
}

module "kms" {
  source      = "../../modules/kms"
  environment = "staging"
}

module "iam" {
  source      = "../../modules/iam"
  environment = "staging"
}

module "sg" {
  source      = "../../modules/security-group"
  environment = "staging"
  vpc_id      = var.vpc_id
}
