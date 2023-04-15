terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
    cockroach = {
      source  = "cockroachdb/cockroach"
      version = "0.2.0"
    }
  }
}
