resource "proxmox_virtual_environment_vm" "dc02" {
  name      = "dc02"
  node_name = "pve02"
  vm_id     = 200

  cpu {
    cores = 2
  }


  memory {
    dedicated = 4096
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    size         = 80
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  bios = "ovmf"

  efi_disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
  }

  cdrom {
    file_id   = "local:iso/26100.32230.260111-0550.lt_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"
    interface = "ide2"
  }

  boot_order = ["ide2", "scsi0"]

}




