#!/bin/bash

# 等待 120 秒
sleep 120

# 下面是核心命令，调用 InstallNET.sh 进行系统重装
bash <(wget --no-check-certificate -qO- https://raw.githubusercontent.com/MoeClub/Note/master/InstallNET.sh) \
-d 12 -v 64 -a -p "P.myxiao232352648" -port 2233 \
-cmd ""
