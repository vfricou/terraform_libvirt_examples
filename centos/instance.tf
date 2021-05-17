resource "libvirt_domain" "instance" {
  name = var.instance_name
  memory = var.instance_memory
  vcpu = var.instance_vcpu

  cloudinit = libvirt_cloudinit_disk.cloudinit.id

  network_interface {
    network_name = var.instance_net_name
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.rootfs_volume.id
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

