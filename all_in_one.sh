#!/bin/bash

# Create privatekey for CA
openssl genrsa -des3 -out ca.key 4096

# Create certicate for CA
openssl req -x509 -new -nodes -key ca.key -sha256 -days 365 -out ca.crt

# Create private key for user
openssl genrsa -out user.key 4096

# Create CSR for user from private key
openssl req -new -key user.key -subj "/C=TW/ST=Taiwan/L=Taipei City/O=MyOrg/OU=MyUnit/CN=my.domain" -sha256 -out user.csr

# Create user's certicate from CA
openssl x509 -req -in user.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out user.crt -days 30 -sha256

# Above operations can be done with one line
# Create private key and certifcate
# req: Certificate Request(PKCS #10)
# x509: output x509's certificate
# nodes: dont encrypt key
# keyout: private key
# out: certificate
# openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout key.pem -out cert.pem -days 30



