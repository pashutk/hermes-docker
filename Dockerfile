FROM nousresearch/hermes-agent:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    jq \
    vim \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN uv pip install --system "hindsight-client>=0.4.22"

RUN npm install -g @anthropic-ai/claude-code

RUN npm install -g opencode-ai@latest
