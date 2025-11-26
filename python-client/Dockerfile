# syntax=docker/dockerfile:1.20

FROM debian:13-slim
WORKDIR /app
RUN <<EOF
#!/bin/bash
set -euxo pipefail
apt-get update
apt-get install -y --no-install-recommends \
    ca-certificates \
    libltdl7 \
    libkrb5-3 \
    libgssapi-krb5-2 \
    python3-pip \
    python3-venv
apt-get clean
rm -rf /var/lib/apt/lists/*
python3 -m venv --system-site-packages /opt/venv
EOF
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt /tmp/pip-tmp/requirements.txt
RUN <<'EOF'
#!/usr/bin/bash
set -euxo pipefail
python -m pip \
    --disable-pip-version-check \
    --no-cache-dir \
    install \
    -r /tmp/pip-tmp/requirements.txt
rm -rf /tmp/pip-tmp
EOF
COPY *.py ./
ENTRYPOINT ["python3", "main.py"]
