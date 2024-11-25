provider "aws" {
  region = "ap-south-1"
  profile = "config"
  shared_credentials_files = ["/root/.aws/credentials"]
    default_tags {
                tags = {
                    name = "3tier"
                }
    }
}