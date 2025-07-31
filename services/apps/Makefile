SHELL := /bin/bash
CHECK_FLAGS := --check --diff
ADDITIONAL_FLAGS ?=

ifeq ($(mode),debug)
	override ADDITIONAL_FLAGS := $(CHECK_FLAGS) -vvvv
endif

VAULT_PASS_FILE := vault_pass.txt
VAULT_PASS := --vault-pass-file $(VAULT_PASS_FILE)
TAGS := --tags deploy
ANSIBLE_ENV_FILE := ansible.env
INFISICAL_ENV_FILE := infisical.env
ANSIBLE_BASE := . $(INFISICAL_ENV_FILE); . $(ANSIBLE_ENV_FILE); ansible-playbook
EXTRA_HOST := --extra-vars "variable_host=$(hosts)"
EXTRA_SERVICE := --extra-vars "service=$(service)"
ANSIBLE_GALAXY_BASE := ansible-galaxy
ANSIBLE_GALAXY_REQUIREMENTS := requirements.yml

.PHONY: service-deploy batch-deploy install

install: $(ANSIBLE_GALAXY_REQUIREMENTS)
	$(ANSIBLE_GALAXY_BASE) collection install \
		-r $(ANSIBLE_GALAXY_REQUIREMENTS)

service-deploy:
	$(ANSIBLE_BASE) playbooks/deploy-single-service.yaml \
		$(TAGS) $(VAULT_PASS) \
		$(EXTRA_HOST) $(EXTRA_SERVICE) $(ADDITIONAL_FLAGS)

batch-deploy:
	$(ANSIBLE_BASE) playbooks/deploy.yaml \
		$(TAGS) $(VAULT_PASS) \
		$(EXTRA_HOST) $(ADDITIONAL_FLAGS)

fetch-caddy-ssl-certs:
	$(ANSIBLE_BASE) playbooks/certs.yaml \
		$(VAULT_PASS) \
		 $(EXTRA_HOST) $(ADDITIONAL_FLAGS) \
		 -i ../../ansible-common/localhost.ini \
		 --ask-become-pass
