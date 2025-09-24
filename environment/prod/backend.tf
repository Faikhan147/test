# backend.tf (real-time companies style)

terraform {
  backend "s3" {
    bucket         = "terraform-backend-all-env"
    key            = "eks/values/prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks-values-prod"
  }
}
