provider "aws" {
  region = "ap-south-1"
  profile = "config"
    default_tags {
                tags = {
                    name = "3tier"
                }
    }
}

terraform {
  backend "s3" {
    bucket = "backend-block-bucket1"
    key = "terraform.tfstate"
    dynamodb_table = "backend-db-backend-block"
    region = "ap-south-1"
        profile = "config"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
  }
}