locals {
  cluster_name = "profilr"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
