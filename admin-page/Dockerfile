FROM alpine/openssl:3.1.4

RUN apk add --no-cache argon2=20190702-r5

VOLUME [ "/token" ]

COPY generate_tkn.sh /usr/local/bin/gentkn

WORKDIR /token

ENTRYPOINT [ "gentkn" ]
