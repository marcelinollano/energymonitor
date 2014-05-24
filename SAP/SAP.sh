#!/bin/sh

while true
do
  curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://0.0.0.0:3000/sap/1 -d '{"sap":{"bill": "323.5", "price": "0.13"}}'
  echo
  echo
  echo "Current price is: 0.13, bill is: 323.5"
  sleep 3m

  curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://0.0.0.0:3000/sap/1 -d '{"sap":{"bill": "323.6", "price": "0.16"}}'
  echo
  echo
  echo "Current price is: 0.16, bill is: 323.6"
  sleep 3m

  curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://0.0.0.0:3000/sap/1 -d '{"sap":{"bill": "323.7", "price": "0.22"}}'
  echo
  echo
  echo "Current price is: 0.22, bill is: 323.7"
  sleep 3m

  curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://0.0.0.0:3000/sap/1 -d '{"sap":{"bill": "323.8", "price": "0.18"}}'
  echo
  echo
  echo "Current price is: 0.18, bill is: 323.8"
  sleep 3m

  curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X PUT http://0.0.0.0:3000/sap/1 -d '{"sap":{"bill": "323.9", "price": "0.16"}}'
  echo
  echo
  echo "Current price is: 0.16, bill is: 323.9"
  sleep 3m
done