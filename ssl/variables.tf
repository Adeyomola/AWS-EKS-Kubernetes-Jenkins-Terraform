variable "email" {}
variable "table_name" {
  description = "Dynamo DB Table Name"
  default     = "adeyomola_dynamodb"
}
variable "bucket_name" {
  description = "S3 Bucket Name"
  default     = "adeyomola-tfstate-bucket"
}

variable "namespaces" {
  description = "namespaces list"
  default     = ["profilr", "sock-shop"]
}

variable "domain_name" {
  type    = string
  default = "adeyomola.tech"
}
