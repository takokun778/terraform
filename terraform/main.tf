terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
    cockroach = {
      source  = "cockroachdb/cockroach"
      version = "1.4.0"
    }
    upstash = {
      source  = "upstash/upstash"
      version = "1.3.0"
    }
  }
}
