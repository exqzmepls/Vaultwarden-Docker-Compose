#!/bin/ash
#
# Generates admin token

# shellcheck shell=dash

set -e

readonly PLAIN_TOKEN=token
readonly TOKEN_HASH=hash

openssl rand -base64 60 | tr -d '\n' >$PLAIN_TOKEN

# Using the OWASP minimum recommended settings
argon2 "$(openssl rand -base64 32)" -e -id -k 19456 -t 2 -p 1 <$PLAIN_TOKEN >$TOKEN_HASH
