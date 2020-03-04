#!/bin/bash

# convert pfx to cer and key file

function pfx2certs () {

  for f in ${1}/*.pfx;
  do
    CERTNAME=`basename ${f} .pfx`

    openssl pkcs12 -in $f -nocerts -nodes -out  ${1}/${CERTNAME}.pem && \
    openssl rsa -in ${1}/${CERTNAME}.pem -out ${1}/${CERTNAME}.key && \
    openssl pkcs12 -in $f -clcerts -nokeys -out ${1}/${CERTNAME}.cer

    rm -f $f
    #rm -f ${1}/${CERTNAME}.pem

  done;

}


pfx2certs $1
