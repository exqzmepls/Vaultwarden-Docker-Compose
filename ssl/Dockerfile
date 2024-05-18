FROM alpine/openssl:3.1.4

VOLUME [ "/ssl" ]

COPY generate_cert.sh /usr/local/bin/gensslcert

WORKDIR /ssl

ENTRYPOINT [ "gensslcert" ]
