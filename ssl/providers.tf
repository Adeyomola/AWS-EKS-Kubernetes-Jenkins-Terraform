
terraform {
  backend "s3" {
    bucket         = "adeyomola-tfstate-bucket"
    key            = "ssl/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "adeyomola_dynamodb"
  }
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.48.0"
    }
  }
}

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    key    = "deploy/terraform.tfstate"
    bucket = "adeyomola-tfstate-bucket"
    region = "us-east-1"
  }
}
