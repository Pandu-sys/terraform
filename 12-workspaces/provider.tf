terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }

  # remote state storage location
  backend "s3" {
    bucket         = "pandu-remote-state"
    key            = "workspace-devops.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true 
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

