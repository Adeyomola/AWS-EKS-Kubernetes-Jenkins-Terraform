variable "db_user" {}
variable "db_password" {}

variable "domain_name" {
  type    = string
  default = "adeyomola.me"
}

variable "namespaces" {
  type    = set(any)
  default = ["monitoring", "profilr", "sockapp"]
