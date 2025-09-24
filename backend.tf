terraform {
  backend "s3" {
    bucket         = "terraform-backend-all-env"
    key            = "eks/values/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
    dynamodb_table = "terraform-locks-values"
  }
}
