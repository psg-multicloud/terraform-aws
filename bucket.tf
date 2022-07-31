resource "aws_s3_bucket" "bucket1" {
  bucket = "patriciagois-bucket1"
}
 
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.first_bucket.id
  versioning_configuration {
    status = "disabled"
  }
}

