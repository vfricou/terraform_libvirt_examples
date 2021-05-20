data "template_file" "user_data" {
  template = file("${path.module}/${var.cloud_init_user_path}")
}

data "template_file" "network" {
  template = file("${path.module}/${var.cloud_init_network_path}")
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "${var.instance_name}-cloudinit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network.rendered
  pool           = libvirt_pool.terraform.name
}
