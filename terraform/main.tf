terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.4.1"
    }
    cockroach = {
      source  = "cockroachdb/cockroach"
      version = "0.2.0"
    }
    upstash = {
      source  = "upstash/upstash"
      version = "1.3.0"
    }
  }
}
