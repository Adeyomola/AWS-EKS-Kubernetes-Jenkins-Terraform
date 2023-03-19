resource "null_resource" "lb" {
  provisioner "local-exec" {
    command = "aws elb create-load-balancer-listeners --load-balancer-name $(terraform output -raw profilr_lb) --listeners Protocol=SSL,LoadBalancerPort=443,InstanceProtocol=TCP,InstancePort=$(terraform output -raw profilr_np),SSLCertificateId=${aws_acm_certificate.profilr.arn}"
  }
  provisioner "local-exec" {
    command = "aws elb create-load-balancer-listeners --load-balancer-name $(terraform output -raw sock_shop_lb) --listeners Protocol=SSL,LoadBalancerPort=443,InstanceProtocol=TCP,InstancePort=$(terraform output -raw sock_shop_np),SSLCertificateId=${aws_acm_certificate.sock-shop.arn}"
  }
}
#resource "aws_lb_listener_certificate" "sock-shop" {
#  depends_on      = [aws_acm_certificate.sock-shop]
#  listener_arn    = data.aws_lb_listener.sock-shop.arn
#  certificate_arn = aws_acm_certificate.sock-shop.arn
#}
#
#resource "aws_lb_listener_certificate" "profilr" {
#  depends_on      = [aws_acm_certificate.profilr]
#  listener_arn    = data.aws_lb_listener.profilr.arn
#  certificate_arn = aws_acm_certificate.profilr.arn
#}
