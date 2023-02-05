terraform {
  required_providers {
    ciscoasa = {
      source  = "CiscoDevNet/ciscoasa"
      version = "1.3.0"
    }
  }
  cloud {
    organization = "mjftech"
    workspaces {
      name = "tf-asa"
    }
}

provider "ciscoasa" {
}

resource "ciscoasa_network_object" "ipv4host" {
  name  = "ipv4host"
  value = "192.168.10.5"
}