terraform {


# this backend s3 bucket should be created manually , using CI/CD or any script it should not be a part of Terraform files
    backend "s3" {
    bucket = "kmkkkewerwqe455"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}


resource "aws_s3_bucket" "first_bucket" {
  bucket = "kmkkkewerwqe455"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}