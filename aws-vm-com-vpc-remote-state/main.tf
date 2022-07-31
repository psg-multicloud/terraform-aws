terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
        source = "hashcorp/aws"
        version = "4.23.0"
    }
  }
    backend "s3" {
        bucket = "patriciagois-bucket1"
        key = "aws-vm/terraform.tfstate"
        region = "us-east-1"
    }
  }

provider "aws" {
    region = " us-east-1"

    defaults_tags {
        tags = {
            owner = "patriciagois"
            managed-by = "terraform"
        }
    }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "patriciagois-bucket1"
    key = "aws-vpc/terraform.tfstate"
    region = "us-east-1"

   }

}





