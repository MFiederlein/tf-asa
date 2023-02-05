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
}

provider "ciscoasa" {
}

resource "ciscoasa_network_object" "ipv4host" {
  name  = "ipv4host"
  value = "192.168.10.5"
}

resource "ciscoasa_acl" "terraform_acl_1" {
  name = "terraform_acl_1"
  rule {
    source              = "10.0.0.1/32"
    destination         = "192.168.0.0/24"
    destination_service = "tcp/443"
  }
  rule {
    source              = "10.0.1.0/24"
    source_service      = "udp"
    destination         = "172.16.0.1/32"
    destination_service = "udp/53"
  }
  rule {
    source              = "0.0.0.0/0"
    destination         = "0.0.0.0/0"
    destination_service = "icmp/0"
  }
}