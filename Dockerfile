FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive
ARG TF_VERSION=1.5.7
ARG USERNAME=devuser
ARG USER_UID=1000
ENV AWS_CLI_AUTO_PROMPT=on-partial

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    git \
    jq \
    less \
    ca-certificates \
    sudo \
 && rm -rf /var/lib/apt/lists/*

# Install awscli via pip (keeps image small and easy)
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip \
 && unzip awscliv2.zip \
 && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
 && rm -rf awscliv2.zip aws


# Install Terraform (version via build-arg)
RUN set -eux; \
    curl -fsSL -o /tmp/terraform.zip "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"; \
    unzip /tmp/terraform.zip -d /usr/local/bin; \
    rm /tmp/terraform.zip

# Install kubectl (stable)
RUN curl -fsSL -o /usr/local/bin/kubectl "$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
 && chmod +x /usr/local/bin/kubectl || true

# Create a non-root user for VS Code
RUN groupadd --gid ${USER_UID} ${USERNAME} || true \
 && useradd --uid ${USER_UID} --gid ${USER_UID} -m ${USERNAME} -s /bin/bash || true \
 && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME} \
 && chmod 0440 /etc/sudoers.d/${USERNAME}

WORKDIR /workspace
USER ${USERNAME}
ENV HOME=/home/${USERNAME}

# Default command
CMD [ "bash" ]
