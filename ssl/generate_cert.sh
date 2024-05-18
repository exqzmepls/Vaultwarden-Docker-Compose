#!/bin/ash
#
# Generates self-signed SSL certificate

# shellcheck shell=dash

set -e

readonly CA_KEY=CA-key.pem
readonly CA_CERT=CA.pem
readonly CA_KEY_PASSWORD="env:CA_KEY_PASSWORD"

readonly DOMAIN_KEY=privkey.pem
readonly DOMAIN_CSR=cert.csr
readonly DOMAIN_CERT=cert.pem

readonly FULLCHAIN=fullchain.pem

openssl genpkey -aes256 \
  -algorithm rsa \
  -pkeyopt rsa_keygen_bits:4096 \
  -pass $CA_KEY_PASSWORD \
  -out $CA_KEY

# -addext 'subjectAltName = DNS:hl-ca.deathroll.internal'
openssl req -new -x509 -sha256 \
  -days 365 \
  -subj "$CA_CERT_SUBJ" \
  -key $CA_KEY \
  -passin $CA_KEY_PASSWORD \
  -out $CA_CERT

openssl genpkey \
  -algorithm rsa \
  -pkeyopt rsa_keygen_bits:4096 \
  -out $DOMAIN_KEY

openssl req -new -sha256 \
  -subj "$DOMAIN_CERT_SUBJ" \
  -key $DOMAIN_KEY \
  -out $DOMAIN_CSR

openssl x509 -req -sha256 \
  -days 365 \
  -in $DOMAIN_CSR \
  -CA $CA_CERT \
  -CAkey $CA_KEY \
  -passin $CA_KEY_PASSWORD \
  -out $DOMAIN_CERT

cat $DOMAIN_CERT $CA_CERT >$FULLCHAIN
