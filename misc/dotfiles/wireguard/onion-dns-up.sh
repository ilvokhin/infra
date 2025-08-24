#! /usr/bin/env sh

# macOS as usual has it is own way to do DNS. Even when we set DNS in
# WireGuard config, onion addresses will not be resolved anyway. Moreover,
# nslookup (and probably other standard cli utilities will work properly), but
# Firefox at the same time will not.
# The only workaround I found it to set `SupplementalMatchDomains` manually
# with `scutil`. This trick worked for OpenVPN for long time as well.

iface=$1
dns=$2

scutil <<EOF
d.init
d.add ServerAddresses * $dns
d.add SupplementalMatchDomains * onion
set State:/Network/Service/$iface/DNS
EOF
