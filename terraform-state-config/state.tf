#terraform {

 # backend "s3" {
 #   bucket         = "dev-terraform-state-op7z4c" 
 #   key            = "global/s3/terraform-main.tfstate"
 #   region         = "eu-central-1"
 #   dynamodb_table = "terraform-state"
 #   encrypt        = true
 # }

#}


terraform {
  required_version = "1.10.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
        }
    }
  }

provider "aws" {
  region = "eu-central-1"
}

resource "random_string" "suffix" {
  length  = 14
  special = false
  upper   = false
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.environment}-terraform-state-${random_string.suffix.result}"
  acl    = "private"

 
  block_public_acls         = true
  block_public_policy       = true
  ignore_public_acls        = true
  restrict_public_buckets   = true
  control_object_ownership  = true
  object_ownership          = "ObjectWriter"

  server_side_encryption_configuration = {
    rule = {
     apply_server_side_encryption_by_default = {
        sse_algorithm     = "AES256"   

        }
    }
  }

  versioning = {
    enabled = true
    }

tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
        }

    }



module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "terraform-state"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}