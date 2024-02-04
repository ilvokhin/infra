#! /usr/bin/env bash

tmp=`mktemp -d`

cd $tmp

# SSH protocol
git clone git@git.ilvokhin.com:infra.git > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "ssh: OK"
    rm -rf infra
else
    echo "ssh: FAIL"
fi

# SSH protocol absolute path
git clone ssh://git@git.ilvokhin.com:/srv/git/infra.git > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "ssh absolute: OK"
    rm -rf infra
else
    echo "ssh absolute: FAIL"
fi

cd - > /dev/null
rm -rf $tmp
