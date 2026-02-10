FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# hadolint ignore=DL3008
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        # Core utilities
        curl \
        ca-certificates \
        # Build tools
        build-essential \
        llvm \
        # Compression libraries
        zlib1g-dev \
        libbz2-dev \
        liblzma-dev \
        xz-utils \
        # Development libraries
        libssl-dev \
        libffi-dev \
        libreadline-dev \
        libsqlite3-dev \
        libncursesw5-dev \
        libxml2-dev \
        libxmlsec1-dev \
        libonig-dev \
        tk-dev && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Install hadolint for Dockerfile linting
# Needed for the Dockerfile linter in the pre-commit hooks
RUN curl -fsSL -o /usr/local/bin/hadolint https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-arm64 && \
    chmod +x /usr/local/bin/hadolint

USER vscode

# Install uv
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH="/home/vscode/.local/bin:${PATH}"
