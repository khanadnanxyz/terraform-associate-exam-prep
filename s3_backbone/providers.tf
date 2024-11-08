terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
  backend "s3" {
    bucket  = "tfvars-dhaka-byte-state-bucket-eu-north-1"
    key     = "test/backbone"
    region  = "eu-north-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.s3_region
}