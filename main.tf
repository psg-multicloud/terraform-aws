terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
        source = "hashcorp/aws"
        version = "4.23.0"
    }

    backend "s3" {
        bucket = "patriciagois-bucket1"
        key = "aws-vpc/terraform.tfstate"
        region = "us-east-1"
    }

    #azurerm = {
     #   source = "hashicorp/azurerm"
      #  version = "3.16.0"
    #}
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
#provider "azurerm" {
 #   features {}
  
#}

        
    