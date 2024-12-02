#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.200/g' package/base-files/files/bin/config_generate

# Remove packages
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-adguardhome
rm -rf feeds/luci/applications/luci-app-amlogic
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-passwall2
# Add packages
git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/amlogic
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/adguardhome
# Add luci-app-bypass
git clone https://github.com/jixiewang201907/by-pass.git package/bypass
#svn checkout https://github.com/kiddin9/kwrt-packages/trunk/luci-app-bypass package/bypass
# Add luci-app-smartdns
git clone https://github.com/pymumu/openwrt-smartdns.git packages/smartdns
git clone https://github.com/pymumu/luci-app-smartdns.git packages/luci-app-smartdns
# Add luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall
#git clone -b main https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2
