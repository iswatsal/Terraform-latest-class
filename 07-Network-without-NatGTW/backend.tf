terraform {
  backend "s3" {
    bucket  = "terraform-tf-s3-2024"
    key     = "dev/terraform.tfstate"  
    region  = "us-east-1"
  }
}