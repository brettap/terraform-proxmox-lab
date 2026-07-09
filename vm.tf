resource "proxmox_virtual_environment_vm" "dc02" {
  name      = "dc02"
  node_name = "pve02"
  vm_id     = 200

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  bios    = "ovmf"
  machine = "pc-q35-11.0"

  efi_disk {
    datastore_id      = "local-zfs"
    type              = "4m"
    pre_enrolled_keys = true
  }

  tpm_state {
    datastore_id = "local-zfs"
    version      = "v2.0"
  }

  cdrom {
    file_id   = "local:iso/26100.32230.260111-0550.lt_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"
    interface = "ide2"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "ide0"
    size         = 80
  }

  boot_order = ["ide0", "ide2", "net0"]
}
