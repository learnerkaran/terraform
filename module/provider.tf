provider "aws" {
  region = "ap-south-1"
  profile = "config"
    default_tags {
                tags = {
                    name = "3tier"
                }
    }
}
