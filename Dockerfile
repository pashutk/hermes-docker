FROM nousresearch/hermes-agent:v2026.4.23

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    gh \
    jq \
    vim \
    curl \
    unzip \
    tmux \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN cd /opt/hermes && uv pip install "hindsight-client>=0.4.22"

RUN npm install -g @anthropic-ai/claude-code

RUN npm install -g opencode-ai@latest

RUN mkdir -p /home/hermes \
 && usermod -d /home/hermes hermes \
 && chown -R hermes:hermes /home/hermes
