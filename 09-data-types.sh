#!/bin/bash
#everything in shell is considerd as string

NUMBER1=100
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "Sum is :${SUM}"

LEADERS=("Modi" "Putin" "Trump" "Siva")

echo "All Leaders: ${LEADERS[@]}"
echo "First Leader: ${LEADERS[0]}"
echo "10th Leader: ${LEADERS[10]}"