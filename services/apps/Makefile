CHECK_FLAGS := --check --diff
ADDITIONAL_FLAGS ?=

ifeq ($(mode),debug)
	override ADDITIONAL_FLAGS := $(CHECK_FLAGS) -vvvv
endif

VAULT_PASS_FILE := vault_pass.txt
VAULT_PASS := --vault-pass-file $(VAULT_PASS_FILE)
TAGS := --tags deploy
ANSIBLE_BASE := ansible-playbook
EXTRA_HOST := --extra-vars "variable_host=$(hosts)"
EXTRA_SERVICE := --extra-vars "service=$(service)"

.PHONY: service-deploy batch-deploy

service-deploy:
	$(ANSIBLE_BASE) playbooks/deploy-single-service.yaml \
		$(TAGS) $(VAULT_PASS) \
		$(EXTRA_HOST) $(EXTRA_SERVICE) $(ADDITIONAL_FLAGS)

batch-deploy:
	$(ANSIBLE_BASE) playbooks/deploy.yaml \
		$(TAGS) $(VAULT_PASS) \
		$(EXTRA_HOST) $(ADDITIONAL_FLAGS)
