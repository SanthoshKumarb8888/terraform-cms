terraform {
  backend "s3" {
    bucket         = "tf-state-cms"
    key            = "cms/statefile.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-dynamodb-cms"
    encrypt        = true
  }
}
