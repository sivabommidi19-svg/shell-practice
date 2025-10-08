#! /bin/bash

set -e

error(){
    echo "There is an error"
}

trap error ERR 

echo "Hello"
echo "Before error.."
asvdjhavdfv; dnf #here shell understand there is an error and signak is ERR
echo "After error"