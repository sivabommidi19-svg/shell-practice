#!/bin/bash

#DATE=$(date)

START_TIME=$(date +%s)

sleep 10 &

TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Script executed in: $TOTAL_TIME Seconds"