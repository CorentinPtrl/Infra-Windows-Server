terraform {
  required_providers {
    esxi = {
      source = "josenk/esxi"
      version = "1.10.3"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "Default" {
  guest_name = var.vm_hostname
  guestos    = "windows2019srvNext-64"
  disk_store = var.disk_store

  ovf_source        = var.ovf_file

  network_interfaces {
    virtual_network = var.virtual_network
  }
}
