terraform {
  required_version = "1.10.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }




  backend "s3" {
    bucket         = "dev-terraform-state-p8bpxhodpahp30"
    key            = "global/vpc/terraform-vpc.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.region

  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }

  # Make it faster by skipping something
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}
