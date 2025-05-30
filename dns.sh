#!/bin/bash

set -e

# 备份
if [ ! -f /etc/resolv.conf.bak ]; then
    cp /etc/resolv.conf /etc/resolv.conf.bak
    echo "[✔] 已备份 /etc/resolv.conf 到 /etc/resolv.conf.bak"
fi

# 处理 systemd-resolved
if systemctl is-active --quiet systemd-resolved; then
    echo "[ℹ] 检测到 systemd-resolved，正在配置..."

    # 禁用 systemd-resolved 的 DNS 控制
    systemctl disable systemd-resolved --now
    rm -f /etc/resolv.conf
    touch /etc/resolv.conf
fi

# 设置 DNS
cat > /etc/resolv.conf <<EOF
nameserver 1.1.1.1
nameserver 8.8.8.8
EOF

echo "[✔] DNS 设置已更新为 1.1.1.1 和 8.8.8.8"
