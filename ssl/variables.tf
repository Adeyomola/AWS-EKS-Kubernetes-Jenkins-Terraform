variable "email" {}
variable "table_name" {
  description = "Dynamo DB Table Name"
  value       = "adeyomola_dynamodb"
}
variable "bucket_name" {
  description = "S3 Bucket Name"
  value       = "adeyomola-tfstate-bucket"
}
