variable "storage_pool_name" {
  type    = string
  default = "terraform"
}
variable "storage_pool_type" {
  type    = string
  default = "dir"
}
variable "storage_pool_path" {
  type    = string
  default = "/tmp/terraform_pool"
}
variable "image_path" {
  type    = string
  default = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-2009.qcow2"
}
variable "image_format" {
  type    = string
  default = "qcow2"
}
variable "instance_name" {
  type    = string
  default = "tf-centos"
}
variable "instance_memory" {
  type    = string
  default = "2048"
}
variable "instance_vcpu" {
  type    = string
  default = "1"
}
variable "instance_disk" {
  type    = string
  default = "21474836480"
}
variable "instance_net_name" {
  type    = string
  default = "default"
}
variable "cloud_init_user_path" {
  type    = string
  default = "../cloud_init_configs/centos_user_config.yml"
}
variable "cloud_init_network_path" {
  type    = string
  default = "../cloud_init_configs/centos_network_config.yml"
}
