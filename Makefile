.PHONY: help ansible-lint ansible-lint-fix hadolint-install hadolint-docker hadolint-local pre-commit-install pre-commit-run pre-commit-update molecule-test molecule-converge molecule-verify molecule-destroy molecule-test-all

.DEFAULT_GOAL := help

# Capture arguments for ansible-lint targets
ifeq (ansible-lint,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (ansible-lint-fix,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

help: # Show this help message
	@awk 'BEGIN {FS = ":.*?# "; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?# / {gsub(/^[ \t]+/, "", $$2); printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

ansible-lint: # Lint playbooks (specify path or omit for all)
	@if [ -z "$(RUN_ARGS)" ]; then \
		uv run ansible-lint playbooks/; \
	else \
		uv run ansible-lint $(RUN_ARGS); \
	fi

ansible-lint-fix: # Auto-fix ansible-lint issues (specify path or omit for all)
	@if [ -z "$(RUN_ARGS)" ]; then \
		uv run ansible-lint --fix playbooks/; \
	else \
		uv run ansible-lint --fix $(RUN_ARGS); \
	fi

hadolint-install: # Install hadolint locally
	@echo "Installing hadolint..."
	@sudo wget -O /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-$(shell uname -m) && \
	sudo chmod +x /usr/local/bin/hadolint && \
	echo "✓ hadolint installed: $$(hadolint --version)"

hadolint-docker: # Lint Dockerfile using Docker container (no local install needed)
	@docker run --rm -i hadolint/hadolint < .devcontainer/Dockerfile

hadolint-local: # Lint Dockerfile using locally installed hadolint
	@hadolint .devcontainer/Dockerfile

pre-commit-install: # Install and set up pre-commit hooks
	@uv run pre-commit install

pre-commit-run: # Run pre-commit hooks on all files
	@uv run pre-commit run --all-files

pre-commit-update: # Update pre-commit hooks to latest versions
	@uv run pre-commit autoupdate

install-docker: # Install Docker using the playbook locally
	@uv run ansible-playbook -i localhost, -c local playbooks/install_docker.yml --ask-become-pass

install-docker-check: # Check what would change without applying (dry-run)
	@uv run ansible-playbook -i localhost, -c local playbooks/install_docker.yml --check --diff

molecule-test: # Run full Molecule test cycle (destroy, create, converge, verify, destroy)
	@uv run --dev molecule test

molecule-converge: # Create instances and apply playbook (keep instances running)
	@uv run --dev molecule converge

molecule-verify: # Run verification tests on existing instances
	@uv run --dev molecule verify

molecule-destroy: # Destroy test instances
	@uv run --dev molecule destroy

molecule-test-all: # Run Molecule tests on all platforms sequentially
	@uv run --dev molecule test --all
