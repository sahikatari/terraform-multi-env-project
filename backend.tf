terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-sahi"
    key            = "multi-env/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}