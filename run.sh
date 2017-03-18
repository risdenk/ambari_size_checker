#!/usr/bin/env bash

set -e

for line in $(cat urls.txt);
do
  VERSION=$(echo $line | cut -d',' -f 1)
  URL=$(echo $line | cut -d',' -f 2)
  echo $VERSION
  ./analyze_size.sh $VERSION $URL
done

