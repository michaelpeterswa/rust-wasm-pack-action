# -=-=-=-=-=-=- Setup Rust Build Container -=-=-=-=-=-=-

FROM rust:alpine as rust-setup

# Set GitHub Actions Metadata
LABEL "com.github.actions.name"="Rust 'wasm-pack' Action"
LABEL "com.github.actions.description"="GitHub action to wasm-pack a Rust project"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="blue"

# Set Repository Metadata
LABEL version="1.0.0"
LABEL repository="https://github.com/michaelpeterswa/rust-wasm-pack-action"
LABEL maintainer="Michael Peters <michael@michaelpeterswa.com>"

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk update && \ 
    apk add --no-cache musl-dev=1.2.3-r0 curl=7.83.1-r2 && \
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | ash

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]