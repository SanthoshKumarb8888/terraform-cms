locals {
  bucket_name = "cms-card-process-bucket"
  environment = "dev"

  tags = {
    Name        = local.bucket_name
    Environment = local.environment
  }
}
