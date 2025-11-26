# syntax=docker/dockerfile:1.20

FROM golang:1.25.4 AS build
WORKDIR /build
COPY go.* .
RUN go mod download
COPY *.go .
RUN CGO_ENABLED=0 go build -ldflags="-s"

# NB we use the 13-slim (instead of scratch) image so we can enter the
#    container to execute bash etc.
FROM debian:13-slim
WORKDIR /app
RUN <<EOF
#!/bin/bash
set -euxo pipefail
apt-get update
apt-get install -y --no-install-recommends \
    curl
rm -rf /var/lib/apt/lists/*
EOF
COPY --from=build /build/go-client /usr/local/bin/
ENTRYPOINT ["go-client"]
