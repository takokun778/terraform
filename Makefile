include .secret.env
export

.PHONY: help
help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: tool
tool: ## Instal tool
	@aqua i

.PHONY: env
env: ## Create .env file
	@cp .env.template .secret.env

.PHONY: init
init: ## Terraform initialize
	@(cd terraform && terraform init)

.PHONY: fmt
fmt: ## Terraform format
	@terraform fmt -recursive

.PHONY: lint
lint: ## Terraform format check and terraform validate
	@terraform fmt -recursive -check
	@terraform validate

.PHONY: plan
plan: ## Terraform plan
	@(cd terraform && terraform plan)

.PHONY: apply
apply: ## Terraform apply
	@(cd terraform && terraform apply -lock=false)

.PHONY: key
key: ## Generate key for sops
	@age-keygen

.PHONY: secret
secret: ## Create terraform secret yaml. ex) make secret secret=password
	@script/secret.sh ${secret}

.PHONY: encrypt
encrypt: ## Encrypt terraform secret. ex) make encrypt secret=password
	@script/encrypt.sh ${secret}

.PHONY: decrypt
decrypt: ## Decrypt terraform secret. ex) make decrypt secret=password
	@script/decrypt.sh ${secret}

.PHONY: sops
sops: ## Operation check of sops. The result is output under tmp.
	@script/sops.sh
