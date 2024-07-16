# syntax=docker/dockerfile:1.9

# see https://learn.microsoft.com/en-us/sql/connect/python/pyodbc/step-1-configure-development-environment-for-pyodbc-python-development?view=sql-server-ver16&tabs=linux
FROM debian:12-slim
WORKDIR /app
RUN <<EOF
#!/bin/bash
set -euxo pipefail
apt-get update
apt-get install -y --no-install-recommends \
    curl \
    gpg \
    ca-certificates \
    python3-pyodbc
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg
curl -fsSL https://packages.microsoft.com/config/debian/12/prod.list \
    > /etc/apt/sources.list.d/mssql-release.list
apt-get update
ACCEPT_EULA=Y apt-get install -y msodbcsql18
rm -rf /var/lib/apt/lists/*
EOF
COPY *.py ./
ENTRYPOINT ["python3", "main.py"]
