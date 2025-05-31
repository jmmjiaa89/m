#!/bin/bash
sed -i 's/#DNS=/DNS=1.1.1.1/g' /etc/systemd/resolved.conf
sed -i 's/#FallbackDNS=/FallbackDNS=8.8.8.8/g' /etc/systemd/resolved.conf
systemctl restart systemd-resolved
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
