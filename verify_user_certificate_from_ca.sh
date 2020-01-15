#!/bin.bash
[ $# -le 1 ] && echo "usage: verify_user_certificate_from_ca.sh user.crt ..." && exit 1

openssl verify -verbose -CAfile ca.crt $@
