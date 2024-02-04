#! /usr/bin/env bash

tmp=`mktemp -d`

cd $tmp

# HTTP protocol
git clone http://git.ilvokhin.com/infra.git > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "http: OK"
    rm -rf infra
else
    echo "http: FAIL"
fi

# HTTPS protocol
git clone https://git.ilvokhin.com/infra.git > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "https: OK"
    rm -rf infra
else
    echo "https: FAIL"
fi

cd - > /dev/null
rm -rf $tmp
