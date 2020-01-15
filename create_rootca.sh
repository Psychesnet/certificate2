#!/bin/bash

# Create privatekey for CA
openssl genrsa -des3 -out ca.key 4096

# Create certicate for CA
openssl req -x509 -new -nodes -key ca.key -sha256 -days 365 -out ca.crt

