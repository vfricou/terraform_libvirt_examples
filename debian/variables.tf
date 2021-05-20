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
  default = "https://cdimage.debian.org/images/cloud/buster/20210329-591/debian-10-generic-amd64-20210329-591.qcow2"
}
variable "image_format" {
  type = string
  default = "qcow2"
}
variable "instance_name" {
  type = string
  default = "tf-debian"
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
  default = "../cloud_init_configs/debian_user_config.yml"
}
variable "cloud_init_network_path" {
  type = string
  default = "../cloud_init_configs/debian_network_config.yml"
}
