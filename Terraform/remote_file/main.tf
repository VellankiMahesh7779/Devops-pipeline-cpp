provider "aws"{
    region ="us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
bucket = "mahesh-vivi-terraform-s3-bucket-7779"

}