#!/usr/bin/env bash

set -e

echo -n "" > urls.txt
for fullVersion in $(cat versions.txt);
do
  version=$(echo $fullVersion | cut -d'-' -f1)
  majorVersion=$(echo $fullVersion | cut -d'.' -f1)
  url=$(s3cmd ls s3://public-repo-1.hortonworks.com/ambari/centos6/${majorVersion}.x/updates/$version/ambari/ | grep ambari-server | awk '{print $4}' | sed 's/s3/http/')
  echo "$fullVersion,$url" >> urls.txt
done
