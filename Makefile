SHELL := /bin/bash

.DEFAULT_GOAL := help

.PHONY: help

help:
	@echo "Usage:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

sandbox: ## Build the whole sandbox 
	vagrant up kali --provision
	vagrant up juiceshop
	vagrant up dvwa
	vagrant up metasploitable

kali: ## Build the Kali box
	vagrant up kali --provision

teardown: ## Tear down the sandbox
	vagrant halt kali
	vagrant halt juiceshop
	vagrant halt dvwa
	vagrant halt metasploitable

destroy: ## Destroy the sandbox
	vagrant destroy
