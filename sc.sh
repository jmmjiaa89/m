#!/bin/bash

# 设置 systemd-resolved DNS 配置
RESOLVED_CONF="/etc/systemd/resolved.conf"
sed -i 's/^#\?DNS=.*/DNS=1.1.1.1/' "$RESOLVED_CONF"
sed -i 's/^#\?FallbackDNS=.*/FallbackDNS=8.8.8.8/' "$RESOLVED_CONF"
sed -i 's/^#\?DNSStubListener=.*/DNSStubListener=yes/' "$RESOLVED_CONF"

# 如果没有相应条目，添加
grep -q "^DNS=" "$RESOLVED_CONF" || echo "DNS=1.1.1.1" >> "$RESOLVED_CONF"
grep -q "^FallbackDNS=" "$RESOLVED_CONF" || echo "FallbackDNS=8.8.8.8" >> "$RESOLVED_CONF"
grep -q "^DNSStubListener=" "$RESOLVED_CONF" || echo "DNSStubListener=yes" >> "$RESOLVED_CONF"

# 链接 resolv.conf 到 stub
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# 阻止 cloud-init 管理 resolv.conf
mkdir -p /etc/cloud/cloud.cfg.d
echo "manage_resolv_conf: false" > /etc/cloud/cloud.cfg.d/99-disable-resolv.conf.cfg

# 重启服务
systemctl restart systemd-resolved
