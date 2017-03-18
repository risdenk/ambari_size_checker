#!/usr/bin/env bash

set -e
set -u

VERSION="$1"
URL="$2"

wget -q $URL

ls -lh ambari-server-${VERSION}*.rpm

rpm -qp --queryformat '[%{FILESIZES} %{FILENAMES}\n]' ambari-server-${VERSION}*.rpm | sort -n -r | head -n 5

rm -f ambari-server-${VERSION}*.rpm

