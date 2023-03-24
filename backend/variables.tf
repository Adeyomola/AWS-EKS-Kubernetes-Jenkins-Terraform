variable "table_name" {
  description = "Dynamo DB Table Name"
  default       = "adeyomola_dynamodb"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 Bucket Name"
  default       = "adeyomola-tfstate-bucket"
}
