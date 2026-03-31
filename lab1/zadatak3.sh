#!/bin/bash

if ! test -d "$1"
then 
    echo "Prvi argument treba biti direktorij"
    exit 1
fi

cd "$1"

for file in $(find -type f -name "localhost_access_log.*-02-*.txt")
do
    year=$(echo "${file:23:4}")
    day=$(echo "${file:31:2}")
    echo "datum: $day-02-$year"
    echo "---------------------------------------------"
    cut -d '"' -f2 "$file" | sort | uniq -c | sed -E 's/([[:digit:]]+)/\1 :/'
done