resource "libvirt_domain" "deb_instance" {
  count  = length(var.instance_name)
  name   = var.instance_name[count.index]
  memory = var.instance_memory[count.index]
  vcpu   = var.instance_vcpu[count.index]

  cloudinit = libvirt_cloudinit_disk.clin_debian[count.index].id

  network_interface {
    network_name = var.net_name
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
    volume_id = libvirt_volume.rootfs_master_resized[count.index].id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
