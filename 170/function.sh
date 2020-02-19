#!/bin/bash

greeting () {
  echo Hello $1
}

greeting 'Jeffrey'

echo

greeting2 () {
  echo "Hello $1"
  echo "Hello $2"
}

greeting2 'Jeffrey' 'Walter'