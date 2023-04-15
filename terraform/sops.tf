provider "sops" {}

data "sops_file" "cockroach_db_user_password" {
  source_file = "sops/cockroach-db-user-password.enc.json"
}
