resource "aws_s3_bucket" "example" {
  bucket = local.bucket_name

  tags = local.tags

  versioning {
    enabled = true
  }
  acl    = "private"
}

  

