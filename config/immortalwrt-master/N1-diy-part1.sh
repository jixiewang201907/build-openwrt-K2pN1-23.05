#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.200/g' package/base-files/files/bin/config_generate

# geodata
wget -q -cP files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -q -cP files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

# Add packages
#git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/amlogic
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/adguardhome

# Add luci-app-bypass
git clone https://github.com/jixiewang201907/by-pass.git package/bypass

# Add luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns.git package/smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# Add luci-app-passwall
#git clone -b main https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
