#!/bin/bash
cd openwrt
# Add a feed source
echo "src-git amlogic https://github.com/ophub/luci-app-amlogic.git;main" >> "feeds.conf.default"
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"
echo "src-git SSRplus https://github.com/fw876/helloworld.git;master" >> "feeds.conf.default"
echo "src-git bypass https://github.com/jixiewang201907/by-pass.git;main" >> "feeds.conf.default"
