#!/bin/bash

if ! test -d "$1"
then 
    echo "Prvi argument treba biti direktorij"
    exit 1
fi

if ! test -d "$2"
then 
    echo "Drugi argument treba biti direktorij"
    exit 1
fi

passed=""
counter=0

for file1 in $(find "$1" -type f)
do
    filename=$(echo "$file1" | sed 's/.*\///')
    if test -e "$(find "$2" -type f -name $filename)"
    then
        file2=$(find "$2" -type f -name $filename)
        if [ $file1 -nt $file2 ]
        then
            echo "$file1 --> $2"
        else
            echo "$file2 --> $1"
        fi
        passed="$passed$filename/"
        counter=$((counter+1))
    else
        echo "$file1 --> $2"
    fi
done

for file2 in $(find "$2" -type f)
do
    filename2=$(echo "$file2" | sed 's/.*\///')
    finished="false"
    for i in $(seq $((counter)))
    do
        filenamePassed=$(echo $passed | cut -d '/' -f$i)
        if test $filenamePassed = $filename2
        then
            finished="true"
        fi
    done
    if test $finished = "false"
    then
        echo "$file2 --> $1"
    fi
done