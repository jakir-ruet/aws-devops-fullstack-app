# https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions
# Terraform (Setting) Block
terraform {
  required_version = "~> 1.14.3" # Terraform Version
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.61.0" # AWS Provider Version
    }
  }
}

# Provider Block
provider "aws" {
  region  = "us-east-1" # AWS Region
  profile = "default"   # AWS CLI Profile
}
