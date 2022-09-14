# Configure Terraform and AWS Provider Plugins version
terraform {
  required_version = ">= 1.0.11"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.1"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      app       = "ureport"
      msp       = "lti"
      terraform = true
    }
  }
}

