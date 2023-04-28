provider "sops" {}

data "sops_file" "cockroach_db_user_password" {
  source_file = "sops/cockroach-db-user-password.enc.json"
}

data "sops_file" "upstash_email" {
  source_file = "sops/upstash-email.enc.json"
}

data "sops_file" "upstash_api_key" {
  source_file = "sops/upstash-api-key.enc.json"
}
