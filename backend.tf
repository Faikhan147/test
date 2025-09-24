terraform {
  backend "s3" {
    bucket         = "terraform-backend-all-env"
    key            = "eks/${terraform.workspace}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks-values"
  }
}
