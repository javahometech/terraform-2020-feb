provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "javahome-2020-tf123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
