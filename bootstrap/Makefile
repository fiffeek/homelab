CHECK_FLAGS := --check --diff
ADDITIONAL_FLAGS ?=

ifeq ($(mode),debug)
	override ADDITIONAL_FLAGS := $(CHECK_FLAGS) -vvvv
endif

ANSIBLE_BASE := ansible-playbook

.PHONY: provisioning

provisioning:
	$(ANSIBLE_BASE) playbooks/provisioning.yaml \
		$(ADDITIONAL_FLAGS)
