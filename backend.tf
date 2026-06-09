terraform {
  backend "s3" {
    bucket = "common-tf-statefiles"
    key    = "demo-ec2-deployment/s3.tfstate"
    region = "ap-south-1"
  }
}

