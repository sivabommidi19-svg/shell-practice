#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then
    echo "Given number $NUMBER is Less then 10"
elif[ $NUMBER -eq 10 ]; then
    echo "Given Number $NUMBER is equal to 10"
else
    echo "Given number $NUMBER is greater then 10"
fi 
 
 # -gt
 # -eq
 # -ne
