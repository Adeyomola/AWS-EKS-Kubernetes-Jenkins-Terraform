resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email
}

resource "acme_certificate" "certificate" {
  account_key_pem = acme_registration.reg.account_key_pem
  common_name     = "${var.namespaces[1]}.${var.domain_name}"
  dns_challenge {
    provider = "route53"
  }
}

resource "acme_registration" "reg2" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email
}

resource "acme_certificate" "certificate2" {
  account_key_pem = acme_registration.reg2.account_key_pem
  common_name     = "${var.namespaces[0]}.${var.domain_name}"
  dns_challenge {
    provider = "route53"
  }
}
