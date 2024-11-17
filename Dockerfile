#
# docker buildx build  --platform linux/arm64/v8,linux/amd64 --tag compound45/dev:wireguard-vanity-address -f Dockerfile .
#
# --
# minimally run:
# docker run -it --rm compound45/dev:wireguard-vanity-address X/
# --

ARG DISTRO=alpine:latest

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
FROM scratch

# Copy over the user
COPY --from=builder /etc/passwd /etc/passwd

USER user
WORKDIR /home/user

COPY --from=builder /home/user/target/release/wireguard-vanity-address ./

ENTRYPOINT ["/home/user/wireguard-vanity-address"]
