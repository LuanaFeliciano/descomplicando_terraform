terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   backend "s3" {
    bucket = "descomplicando-terraform-luana-s3"
    key    = "backend-aula"
    region = "us-east-2"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}
