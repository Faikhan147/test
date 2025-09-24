module "kms" {
  source      = "../../modules/kms"
  environment = "prod"
}

module "iam" {
  source      = "../../modules/iam"
  environment = "prod"
}

module "sg" {
  source      = "../../modules/security-group"
  environment = "prod"
  vpc_id      = var.vpc_id
}
