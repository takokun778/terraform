include .secret.env
export

.PHONY: help
help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

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
