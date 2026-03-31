#!/bin/bash

grep -i 'banana\|jabuka\|jagoda\|dinja\|lubenica' namirnice.txt

grep -iv 'banana\|jabuka\|jagoda\|dinja\|lubenica' namirnice.txt

grep -rE '( |^)[[:upper:]]{3}[123456789][0123456789]{5}( |$)' ~/projekti/

find ./ -mtime +6 -mtime -15 -ls

for i in {1..15}; do echo "Broj $i"; done

kraj=10
for i in $(seq $kraj); do echo "Broj $i"; done