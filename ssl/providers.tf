terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "ssl/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = var.table_name
  }
  required_providers {
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }
  }
}

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
