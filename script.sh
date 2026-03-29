#!/bin/bash

if [ $# -lt 2 ]; then
echo "Upotreba: $0 "
exit 1
fi

FILE=$1
WORD=$2

if [ ! -f "$FILE" ]; then
echo "Datoteka ne postoji!"
exit 1
fi

echo "Analiziram datoteku: $FILE"
echo "Tražim riječ: $WORD"
echo "----------------------"

LINES=$(wc -l < "$FILE")
echo "Broj linija: $LINES"

COUNT=$(grep -o "$WORD" "$FILE" | wc -l)
echo "Pojavljivanja riječi '$WORD': $COUNT"

if grep -q "$WORD" "$FILE"; then
echo "Riječ je pronađena u ovim linijama:"
grep "$WORD" "$FILE"
else
echo "Riječ nije pronađena."
fi

echo "Exit status zadnje naredbe: $?"