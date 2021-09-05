data "template_file" "user_data" {
  count    = length(var.instance_name)
  template = file("${path.module}/cloud_init/user.yml")
  vars = {
    hostname       = var.instance_name[count.index]
    net_nameserver = var.net_nameserver
  }
}
data "template_file" "net_data" {
  count    = length(var.instance_name)
  template = file("${path.module}/cloud_init/network.yml")
  vars = {
    net_address = var.net_addr[count.index]
    net_mask    = var.net_mask
    net_gw4     = var.net_gw4
  }
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  count          = length(var.instance_name)
  name           = "${var.instance_name[count.index]}-cloudinit.iso"
  user_data      = data.template_file.user_data[count.index].rendered
  network_config = data.template_file.net_data[count.index].rendered
  pool           = libvirt_pool.terraform.name
}
