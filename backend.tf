terraform {
  backend "s3" {
    bucket         = "terraform-backend-all-env"
    key            = "eks/values/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    dynamodb_table = "terraform-locks-values"
  }
}
