#!/bin/bash

echo $1
echo "$2"

cd $1

cat $(find -type f -name "$2") | wc -l