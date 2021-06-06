#!/usr/bin/env bash
set -eu

SCRIPTDIR=$(dirname $(readlink -f "$0"))

KEY_PREFIX="${1?:must specify prefix}"

cd "${SCRIPTDIR}"

set +e
time nice cargo run --release -- "${KEY_PREFIX}"

send_notification_email "wireguard-vanity-address search for: '${KEY_PREFIX}'; rc: $?"

