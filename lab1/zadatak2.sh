#!/bin/bash

grep -iv 'banana\|jabuka\|jagoda\|dinja\|lubenica' namirnice.txt

grep -rE '( |^)[[:upper:]]{3}[123456789][0123456789]{5}( |$)' ~/projekti/

find ./ -mtime +6 -mtime -15 -ls