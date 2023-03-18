variable "table_name" {
  description = "Dynamo DB Table Name"
  value       = "adeyomola_dynamodb"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  value       = "adeyomola-tfstate-bucket"
}
