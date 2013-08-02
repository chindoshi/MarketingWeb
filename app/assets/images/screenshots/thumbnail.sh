#!/bin/bash
FILES="$@"
for i in $FILES
do
echo "Prcoessing image $i ..."
/usr/bin/convert -crop 250x300+0+0 -border 1x1 -bordercolor "#aaaaaa" $i tb/$i
done
