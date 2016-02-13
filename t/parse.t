#!/usr/bin/env bash

set -eu

echo 1..3
for i in t/parse-*.in; do
    ./parse_test < $i | diff -u - $i.out | while read line; do
        echo "# $line"
    done
    if (( ${PIPESTATUS[1]} == 0 )); then
        echo ok
    else
        echo not ok
    fi
done