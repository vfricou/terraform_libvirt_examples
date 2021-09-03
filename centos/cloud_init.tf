data "template_file" "clin_centos_usr" {
  count    = length(var.instance_name)
  template = file("${path.module}/cloud_init/centos_user.yml")
  vars = {
    hostname = var.instance_name[count.index]
  }
}
data "template_file" "clin_centos_net" {
  count    = length(var.instance_name)
  template = file("${path.module}/cloud_init/centos_network.yml")
  vars = {
    net_address    = var.net_addr[count.index]
    net_mask       = var.net_mask
    net_gw4        = var.net_gw4
    net_nameserver = var.net_nameserver
  }
}

resource "libvirt_cloudinit_disk" "clin_centos" {
  count          = length(var.instance_name)
  name           = "${var.instance_name[count.index]}-cloudinit.iso"
  user_data      = data.template_file.clin_centos_usr[count.index].rendered
  network_config = data.template_file.clin_centos_net[count.index].rendered
  pool           = libvirt_pool.terraform.name
}
