terraform {
  backend "s3" {
    bucket         = "mahesh-vivi-terraform-s3-bucket-7779"
    key            = "Mahesh/terraform.tfstate"
    region         = "us-east-1"
  }
}