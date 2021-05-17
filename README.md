# Terraform libvirt

This repository is base examples to use terraform with libvirt.  

## Introduction

### Requirements

Theses examples require terraform and provisioners :
- template
- [dmacvicar/libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

### Default deployment process

Each examples deploy virtual machine (qemu) and :
- setup user
- setup ssh keys
- configure static network
- install qemu-guest-agent

You could use default template to deploy instances in libvirt with basics terraform commands.  
For example with centos :

```shell
# Go into centos folder
cd centos
# Initialize terraform
terraform init
# Plan terraform deployment
terraform plan
# Perform terraform deployment
terraform apply
# Destroy terraform ressources
terraform destroy
```

## Notes

- Cloud init configurations for debian and opensuse use runcmd to declare DNS.

## Available guests OS

### CentOS

- Default instance image : 7
- Default instance name : tf-centos

All CentOS cloud images could be found [here](https://cloud.centos.org/centos/)  
Terraform with libvirt require image `GenericCloud` in `qcow2` (ex: `CentOS-7-x86_64-GenericCloud-2009.qcow2`)

- [7.2009](https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-2009.qcow2)
- [8-Stream](https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20210210.0.x86_64.qcow2)

### Debian

- Default instance image : 10
- Default instance name : tf-debian

All Debian cloud images could be found [here](https://cdimage.debian.org/images/cloud/)  
Terraform with libvirt require image `generic` or `genericcloud` in `qcow2` (ex: `debian-10-generic-amd64-20210329-591.qcow2`)

- [10](https://cdimage.debian.org/images/cloud/buster/20210329-591/debian-10-generic-amd64-20210329-591.qcow2)
- [11](https://cdimage.debian.org/images/cloud/bullseye/daily/20210517-640/debian-11-genericcloud-amd64-daily-20210517-640.qcow2)


### Ubuntu

- Default instance image : 20.04
- Default instance name : tf-ubuntu

All Ubuntu images could be found [here](https://cloud-images.ubuntu.com/releases)  
Terraform with libvirt require image `cloudimg` in `img` (ex: `ubuntu-21.04-server-cloudimg-amd64.img`)

- [18.04](https://cloud-images.ubuntu.com/releases/bionic/release/ubuntu-18.04-server-cloudimg-amd64.img)
- [20.04](https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img)
- [21.04](https://cloud-images.ubuntu.com/releases/hirsute/release/ubuntu-21.04-server-cloudimg-amd64.img)

### OpenSUSE

- Default instance image : 15.2
- Default instance name : tf-opensuse

All OpenSuse images could be found [here](https://download.opensuse.org/repositories/Cloud:/Images:/)
Terraform with libvirt require image `NoCloud` in `qcow2` (ex: `openSUSE-Leap-15.2.x86_64-1.0.1-NoCloud-Build4.85.qcow2`)

- [15.2](https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.2/images/openSUSE-Leap-15.2.x86_64-1.0.1-NoCloud-Build4.85.qcow2)

## Variables

| Variable          | Default                         | Description                      |
| ----------------- | ------------------------------- | -------------------------------- |
| storage_pool_name | terraform                       | Libvirt storage pool name        |
| storage_pool_type | dir                             | Libvirt storage pool type        |
| storage_pool_path | /tmp/terraform_pool             | Libvirt storage pool location    | 
| image_path        | Refer to (#available-guests-os) | Path or URL to find image        |
| image_format      | qcow2                           | Target hdd volume format         |
| instance_name     | Refer to (#available-guests-os) | Target install name into libvirt |
| instance_memory   | 2048                            | Instance memory allocated        |
| instance_vcpu     | 1                               | Instance vCPU allocated          |
| instance_net_name | default                         | Instance network name to connect |
