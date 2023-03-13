locals {
  cluster_name = "exam-cluster"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
