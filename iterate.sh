#!/bin/bash

for f in $(ls *.html); do
  pandoc $f -o ${f%%.html}.rst
done
