#!/bin/bash

if ! test -d "$1"
then 
    echo "Prvi argument treba biti direktorij"
    exit 1
fi

cd "$1"

dates=$(find -type f -name "*.jpg" | sed -E "s/([[:digit:]]{6})([[:digit:]]{2}_[[:digit:]]*).jpg/\1/" | sort | uniq)

for date in $dates
do
    echo "${date:6:2}-${date:2:4} :"
    echo "-------------"
    counter=0
    for picture in $(find -type f -wholename "${date}*.jpg")
    do
        counter=$((counter + 1))
        echo "    $counter. ${picture:2}"
    done
    echo "--- Ukupno: ${counter} slika ---"
    echo ""
done