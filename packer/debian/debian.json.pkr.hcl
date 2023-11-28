packer {
  required_plugins {
    vmware = {
      source  = "github.com/hashicorp/vmware"
      version = "~> 1"
    }
    git = {
      version = ">= 0.4.3"
      source = "github.com/ethanmdavidson/git"
    }
  }
}

data "git-repository" "cwd" {}

data "git-commit" "cwd-head" {}

variable "esxi_datastore" {
  type = string
}

variable "esxi_host" {
  type = string
}

variable "esxi_password" {
  type = string
}

variable "esxi_username" {
  type = string
}

locals {
  version  = "${data.git-repository.cwd.head}_${data.git-commit.cwd-head.hash}"
}

source "vmware-iso" "debian_12-2" {
  boot_command        = ["<esc><wait>auto preseed/url=https://raw.githubusercontent.com/Entys/Infra-Windows-Server/terraform/packer/debian/preseed.cfg<enter>"]
  boot_wait           = "2s"
  cpus                = 2
  disk_size           = 20140
  format              = "ova"
  guest_os_type       = "debian10-64"
  headless            = true
  iso_checksum        = "sha256:23ab444503069d9ef681e3028016250289a33cc7bab079259b73100daee0af66"
  iso_urls            = ["iso/debian-12.2.0-amd64-netinst.iso", "https://chuangtzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-12.2.0-amd64-netinst.iso"]
  keep_registered     = true
  memory              = 4096
  remote_datastore    = "${var.esxi_datastore}"
  remote_host         = "${var.esxi_host}"
  remote_password     = "${var.esxi_password}"
  remote_type         = "esx5"
  remote_username     = "${var.esxi_username}"
  shutdown_command    = "echo 'shutdown -P now' > shutdown.sh; echo 'vargant'|sudo -S sh 'shutdown.sh'"
  skip_export         = false
  ssh_password        = "packer"
  ssh_port            = 22
  ssh_username        = "packer"
  ssh_wait_timeout    = "20m"
  tools_upload_flavor = "linux"
  vm_name             = "debian-12.2"
  vmx_data = {
    "ethernet0.networkName" = "PfSense_LAN"
  }
  vnc_over_websocket = true
}

build {
  sources = ["source.vmware-iso.debian_12-2"]

}
