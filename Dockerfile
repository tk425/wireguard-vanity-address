#
# docker buildx build --platform linux/arm64/v8,linux/amd64 --tag compound45/dev:wireguard-vanity-address .
# (slow and probably not needed, arm32: linux/arm/v7)
#
# for a different distro, before --platform:
#                     --build-arg DISTRO=ubuntu:24.10
#                     --build-arg DISTRO=debian:stable-slim
# --
# minimally run:
# docker run -it --rm compound45/dev:wireguard-vanity-address X/
# --
# poke around in ubuntu, bash:
# docker run -it --rm --entrypoint=bash compound45/dev:wireguard-vanity-address
# docker run -it --rm --entrypoint=bash compound45/dev:wireguard-vanity-address -c "cat /etc/os-release"
#

ARG DISTRO=alpine:3.20.3

# ---
# build (Rust, dev environment)
# ---
FROM ${DISTRO} AS builder

RUN apk add --no-cache build-base curl 

RUN adduser -S user
USER user
WORKDIR /home/user

# install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# copy source files into container
COPY --chown=user:user . .

# build target
RUN sh -c 'source ".cargo/env" ; cargo fetch'
RUN sh -c 'source ".cargo/env" ; cargo build --release'

# test target (just executes, confirms successful return code)
RUN target/release/wireguard-vanity-address -V
RUN target/release/wireguard-vanity-address "DK/"

# ---
# run (binary only)
# ---
FROM ${DISTRO}

RUN adduser -S user
USER user
WORKDIR /home/user

COPY --from=builder /home/user/target/release/wireguard-vanity-address .

ENTRYPOINT ["/home/user/wireguard-vanity-address"]