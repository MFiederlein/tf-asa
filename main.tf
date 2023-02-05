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
  name  = "ipv4_host"
  value = "192.168.10.5"
}
resource "ciscoasa_network_object" "ipv4range" {
  name  = "ipv4_range"
  value = "192.168.10.5-192.168.10.15"
}
resource "ciscoasa_network_object" "ipv4_subnet" {
  name  = "ipv4_subnet"
  value = "192.168.10.128/25"
}

resource "ciscoasa_access_in_rules" "foo" {
  interface = "inside"
  rule {
    source              = "192.168.10.5/32"
    destination         = "192.168.15.0/25"
    destination_service = "tcp/443"
  }
  rule {
    source              = "192.168.10.0/24"
    source_service      = "udp"
    destination         = "192.168.15.6/32"
    destination_service = "udp/53"
  }
  rule {
    source              = "192.168.10.0/23"
    destination         = "192.168.12.0/23"
    destination_service = "icmp/0"
  }
}