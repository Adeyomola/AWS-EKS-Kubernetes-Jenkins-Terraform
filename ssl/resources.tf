resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email
}

resource "acme_certificate" "profilr" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "${var.namespaces[0]}.${var.domain_name}"
  subject_alternative_names = [data.terraform_remote_state.eks.outputs.profilr_dns]
  dns_challenge {
    provider = "route53"
  }
}

resource "acme_certificate" "sock-shop" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = "${var.namespaces[1]}.${var.domain_name}"
  subject_alternative_names = [data.terraform_remote_state.eks.outputs.sock_shop_dns]
  dns_challenge {
    provider = "route53"
  }
}

resource "aws_acm_certificate" "profilr" {
  private_key      = acme_certificate.profilr.private_key_pem
  certificate_body = acme_certificate.profilr.certificate_pem
}

resource "aws_acm_certificate" "sock-shop" {
  private_key      = acme_certificate.sock-shop.private_key_pem
  certificate_body = acme_certificate.sock-shop.certificate_pem
}
