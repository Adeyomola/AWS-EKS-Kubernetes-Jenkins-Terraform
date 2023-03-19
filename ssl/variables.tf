variable "email" {}
variable "table_name" {
  description = "Dynamo DB Table Name"
  default     = "adeyomola_dynamodb"
}
variable "bucket_name" {
  description = "S3 Bucket Name"
  default     = "adeyomola-tfstate-bucket"
}

variable "domain_name" {
  type    = string
  default = "adeyomola.tech"
}
