resource "aws_s3_bucket" "valid" {
  bucket = "valid"

  tags = {
    Owner = "Mike"
  }
}

resource "aws_s3_bucket" "invalid" {
  bucket = "invalid"
}