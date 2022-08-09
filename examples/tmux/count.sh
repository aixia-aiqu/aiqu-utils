#!/bin/sh


for i in $(seq 0 $1); do
        echo "$i of $1"
        sleep 1
done

echo 'Important results!'
