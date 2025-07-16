#!/bin/bash

set -ex

CERT_LOCATION="/home/fmikina/storage/docker-data/core-apps/caddy/data/data/caddy/pki/authorities/local/root.crt"
CADDY_HOST="cherry-pot.home"
CERTS_LOCAL_DIR="$HOME/certs/caddy"

mkdir -p $CERTS_LOCAL_DIR
ssh ${USER}@${CADDY_HOST} "sudo cat ${CERT_LOCATION}" >"${CERTS_LOCAL_DIR}/root.crt"
