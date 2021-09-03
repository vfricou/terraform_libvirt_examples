resource "libvirt_volume" "rootfs_volume" {
  count  = length(var.instance_name)
  name   = "${var.instance_name[count.index]}.qcow2"
  pool   = libvirt_pool.terraform.name
  source = var.image_path[count.index]
  format = var.image_format
}

resource "libvirt_volume" "rootfs_master_resized" {
  count          = length(var.instance_name)
  name           = "${var.instance_name[count.index]}-resized.qcow2"
  base_volume_id = libvirt_volume.rootfs_volume[count.index].id
  pool           = libvirt_pool.terraform.name
  size           = var.instance_disk[count.index]
}
