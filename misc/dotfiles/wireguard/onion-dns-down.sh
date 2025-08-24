#! /usr/bin/env sh

iface=$1

/usr/sbin/scutil <<EOF
remove State:/Network/Service/$iface/DNS
EOF
