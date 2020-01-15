#!/bin/bash
[ "$1" == "" ] && echo "usage: create_user_key_and_certificate.sh user" && exit 1
user=$1

# Create private key for user
openssl genrsa -out $user.key 4096

# Create CSR for user from private key
openssl req -new -key $user.key -subj "/C=TW/ST=Taiwan/L=Taipei City/O=MyOrg/OU=MyUnit/CN=my.domain" -sha256 -out $user.csr

# Create user's certicate from CA
openssl x509 -req -in $user.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $user.crt -days 30 -sha256

