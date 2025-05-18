terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
  }
  backend "s3" {
    bucket = "rocketseat-bielb1b2-iac"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "rocketseat-bielb1b2-iac"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = true
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "rocketseat-bielb1b2-iac"

  versioning_configuration {
    status = "Enabled"
  }
}
