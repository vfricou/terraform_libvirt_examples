variable "storage_pool_name" {
  type = string
  default = "terraform"
}
variable "storage_pool_type" {
  type = string
  default = "dir"
}
variable "storage_pool_path" {
  type = string
  default = "/tmp/terraform_pool"
}
variable "image_path" {
  type = string
  default = "https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.2/images/openSUSE-Leap-15.2.x86_64-1.0.1-NoCloud-Build4.85.qcow2"
}
variable "image_format" {
  type = string
  default = "qcow2"
}
variable "instance_name" {
  type = string
  default = "tf-opensuse"
}
variable "instance_memory" {
  type = string
  default = "2048"
}
variable "instance_vcpu" {
  type = string
  default = "1"
}
variable "instance_disk" {
  type = string
  default = "21474836480"
}
variable "instance_net_name" {
  type = string
  default = "default"
}
variable "cloud_init_user_path" {
  type = string
  default = "../cloud_init_configs/opensuse_user_config.yml"
}
variable "cloud_init_network_path" {
  type = string
  default = "../cloud_init_configs/opensuse_network_config.yml"
}
