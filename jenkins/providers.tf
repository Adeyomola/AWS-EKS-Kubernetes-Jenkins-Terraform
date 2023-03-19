terraform {
  backend "s3" {
    bucket         = "adeyomola-tfstate-bucket"
    key            = "jenkins/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "adeyomola_dynamodb"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}
