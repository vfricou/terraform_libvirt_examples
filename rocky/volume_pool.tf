resource "libvirt_pool" "terraform" {
  name = var.storage_pool_name
  type = var.storage_pool_type
  path = var.storage_pool_path
}
