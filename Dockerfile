#
# docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag compound45/dev:wireguard-vanity-address .
#
# for a different distro, before --platform:
#                     --build-arg DISTRO=ubuntu:24.04 
# --
# docker run -it --rm compound45/dev:wireguard-vanity-address X/
#

ARG DISTRO=ubuntu:24.04

# ---
# build (Rust, dev environment)
# ---
FROM ${DISTRO} AS builder

RUN apt-get update && apt-get -y install \
  adduser 

RUN apt-get update && apt-get -y install \
  build-essential \
  curl \
  net-tools

RUN adduser user
USER user
WORKDIR /home/user

# install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# copy source files into container
COPY --chown=user:user . .

# build target
RUN bash -c 'source ".cargo/env" ; cargo fetch'
RUN bash -c 'source ".cargo/env" ; cargo build --release'

# test target (just executes, confirms successful return code)
RUN target/release/wireguard-vanity-address -V
RUN target/release/wireguard-vanity-address "DK/"

# ---
# run (binary only)
# ---
FROM ${DISTRO}

RUN apt-get update && apt-get -y install \
  adduser 

RUN adduser user
USER user
WORKDIR /home/user

COPY --from=builder /home/user/target/release/wireguard-vanity-address .

ENTRYPOINT ["/home/user/wireguard-vanity-address"]
