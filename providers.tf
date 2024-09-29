terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }

  backend "s3" {
    bucket         	   = "devopscourse-tfstate"
    key                = "state/terraform.tfstate"
    region         	   = "us-east-1"
    encrypt        	   = true
  }
}



provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = var.user_profile_name
}