output "profilr_lb" {
  value = data.terraform_remote_state.eks.outputs.profilr_lb_name
}

output "sock_shop_lb" {
  value = data.terraform_remote_state.eks.outputs.sock_shop_lb_name
}

output "profilr_np" {
  value = data.terraform_remote_state.eks.outputs.profilr_np
}

output "sock_shop_np" {
  value = data.terraform_remote_state.eks.outputs.sock_shop_np
}
