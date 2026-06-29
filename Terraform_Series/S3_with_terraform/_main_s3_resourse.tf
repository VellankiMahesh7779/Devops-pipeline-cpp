resource "aws_s3_bucket" "my_bucket" {
bucket = "mahesh-vivi-terraform-s3-bucket-7779"

tags = {
Name        = "My S3 Bucket"
Environment = "Dev"
}
}
#Versioning configuration for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}