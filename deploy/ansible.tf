resource "null_resource" "db" {
  provisioner "local-exec" {
    command = "ansible-playbook ./ansible/playbook.yml"
  }
}
