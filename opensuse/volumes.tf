resource "libvirt_volume" "rootfs_volume" {
  name = "${var.instance_name}.qcow2"
  pool = libvirt_pool.terraform.name
  source = var.image_path
  format = var.image_format
}

resource "libvirt_volume" "rootfs_resized" {
  name = "${var.instance_name}-resized.qcow2"
  base_volume_id = libvirt_volume.rootfs_volume.id
  pool = libvirt_pool.terraform.name
  size = var.instance_disk
}
