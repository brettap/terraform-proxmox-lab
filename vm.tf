resource "proxmox_virtual_environment_vm" "dc02" {
    name        = "dc02"
    node_name   = "pve02"
    vm_id       = 200

}


cpu {
  cores = 2
}


memory {
  dedicated = 4096
}