terraform {
  backend "s3" {
    bucket         = "adeyomola-tfstate-bucket"
    key            = "provision/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "adeyomola_dynamodb"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.48.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }
  }

  required_version = "~> 1.3"
}

provider "aws" {
  region = var.region
}
