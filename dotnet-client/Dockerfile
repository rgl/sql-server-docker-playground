# syntax=docker/dockerfile:1.18

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build
COPY *.csproj ./
RUN dotnet restore
COPY *.cs ./
# see https://learn.microsoft.com/en-us/dotnet/core/rid-catalog#linux-rids
RUN dotnet publish \
    --runtime linux-x64 \
    --self-contained \
    --configuration Release \
    --output publish

FROM debian:12-slim
WORKDIR /app
RUN <<EOF
#!/bin/bash
set -euxo pipefail
apt-get update
# install the dotnet dependencies.
# see https://learn.microsoft.com/en-us/dotnet/core/install/linux-debian#12x
# see https://github.com/dotnet/core/blob/main/release-notes/8.0/linux-packages.md
# see https://github.com/dotnet/dotnet-docker/blob/main/src/runtime-deps/8.0/bookworm-slim/amd64/Dockerfile
apt-get install -y --no-install-recommends \
    libc6 \
    libgcc-s1 \
    libicu72 \
    libssl3 \
    libstdc++6 \
    tzdata \
    zlib1g
rm -rf /var/lib/apt/lists/*
EOF
COPY --from=build /build/publish/example ./
ENTRYPOINT ["/app/example"]
