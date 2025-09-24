module "kms" {
  source      = "../../modules/kms"
  environment = var.env
  vpc_id      = var.vpc_id
}

module "iam" {
  source      = "../../modules/iam"
  environment = var.env
  vpc_id      = var.vpc_id
}

module "sg" {
  source      = "../../modules/security-group"
  environment = var.env
  vpc_id      = var.vpc_id
}
