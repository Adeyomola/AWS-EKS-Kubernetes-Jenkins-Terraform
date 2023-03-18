variable "region" {
  default = "us-east-1"
}

variable "key_name" {
description = "SSH Key Name"
  default = "windows11"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  value       = "adeyomola-tfstate-bucket"
}

variable "table_name" {
  description = "Dynamo DB Table Name"
  value       = "adeyomola_dynamodb"
}
