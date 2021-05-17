resource "libvirt_volume" "rootfs_volume" {
  name = "${var.instance_name}.qcow2"
  pool = libvirt_pool.terraform.name
  source = var.image_path
  format = var.image_format
}
