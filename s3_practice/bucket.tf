resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-bucket1234567890"

  tags = {
    Name = "demo practice bucket"
  }
}

