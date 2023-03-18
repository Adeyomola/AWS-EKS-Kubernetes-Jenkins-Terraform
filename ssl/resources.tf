resource "acme_certificate" "certificate" {
  dns_challenge {
    provider = "route53"
    }
}
