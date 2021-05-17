data "template_file" "user_data" {
  template = file("${path.module}/../cloud_init_configs/opensuse_user_config.yml")
}

data "template_file" "network" {
  template = file("${path.module}/../cloud_init_configs/opensuse_network_config.yml")
}

resource "libvirt_cloudinit_disk" "cloudinit" {
  name           = "cloudinit.iso"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network.rendered
  pool           = libvirt_pool.terraform.name
}
