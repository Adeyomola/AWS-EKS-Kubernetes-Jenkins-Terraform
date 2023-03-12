locals {
  cluster_name = "profilr"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "db_user" {}
variable "db_password" {}

variable "domain_name" {
  type    = string
  default = "adeyomola.me"
}
