#! /usr/bin/env bash

tmp=`mktemp -d`

cd $tmp

# Git protocol
git clone git://git.ilvokhin.com/infra.git > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "git: OK"
    rm -rf infra
else
    echo "git: FAIL"
fi

cd - > /dev/null
rm -rf $tmp
