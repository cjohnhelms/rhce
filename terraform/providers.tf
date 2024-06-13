terraform {
  required_providers {
    aws = {
      version = ">= 5.50.0"
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "state-file-rhce-bucket"
    key = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      terraform = true 
    }
  }
}