FROM mcr.microsoft.com/vscode/devcontainers/base

RUN apt-get update && \
    apt-get install -y curl ca-certificates build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

USER vscode

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Install pyenv
RUN curl https://pyenv.run | bash

# Install poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/home/vscode/.local/bin:/home/vscode/.pyenv/bin:${PATH}"
ENV PYENV_ROOT="/home/vscode/.pyenv"

# Initialize pyenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
