PYTHON_BIN := python
NPM_BIN := npm
VENV := venv
REQUIREMENTS_FILE := requirements.txt
NPM_PACKAGE_FILE := package.json
SERVICES_ROOT := services/apps/
BOOTSTRAP_ROOT := bootstrap/
INSTALL_DIR := install

.PHONY: install clean service-deploy

install: $(INSTALL_DIR)/.dir.stamp $(INSTALL_DIR)/.venv.stamp $(INSTALL_DIR)/.npm.stamp $(INSTALL_DIR)/.precommit.stamp $(INSTALL_DIR)/.services.stamp

$(INSTALL_DIR)/.dir.stamp:
	mkdir -p $(INSTALL_DIR)
	touch $@

$(INSTALL_DIR)/.venv.stamp: $(REQUIREMENTS_FILE) | $(INSTALL_DIR)/.dir.stamp
	test -d "$(VENV)" || $(PYTHON_BIN) -m venv "$(VENV)"
	. "$(VENV)/bin/activate"; pip install -Ur "$(REQUIREMENTS_FILE)"
	touch $@

$(INSTALL_DIR)/.npm.stamp: $(NPM_PACKAGE_FILE) | $(INSTALL_DIR)/.dir.stamp
	$(NPM_BIN) install
	touch $@

$(INSTALL_DIR)/.precommit.stamp: $(PRECOMMIT_FILE) $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; pre-commit install
	touch $@

$(INSTALL_DIR)/.services.stamp: $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; cd "$(SERVICES_ROOT)" && $(MAKE) install
	touch $@

service-deploy: $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; cd "$(SERVICES_ROOT)" && $(MAKE) $@

provisioning: $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; cd "$(BOOTSTRAP_ROOT)" && $(MAKE) $@

clean:
	r  -rf "$(VENV)" "$(INSTALL_DIR)"
