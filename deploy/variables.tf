variable "db_user" {}
variable "db_password" {}

variable "domain_name" {
  type    = string
  default = "adeyomola.tech"
}

variable "namespaces" {
  type    = set(any)
  default = ["profilr", "sock-shop", "logging"]
}

variable "namespaces_list" {
  description = "namespaces list"
  default     = ["profilr", "sock-shop"]
}
