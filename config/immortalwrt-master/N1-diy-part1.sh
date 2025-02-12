#!/bin/bash

# Default IP
sed -i 's/192.168.1.1/192.168.2.200/g' package/base-files/files/bin/config_generate

# geodata
wget -q -cp files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -q -cp files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

# add kenzok
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-argon-config
rm -rf feeds/packages/net/{alist,adguardhome,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
rm -rf package/feeds/small/sing-box
rm -rf feeds/small/sing-box
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a 

# Add packages
#git clone --depth=1 https://github.com/ophub/luci-app-amlogic.git package/amlogic
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

# Add luci-app-bypass
#git clone https://github.com/jixiewang201907/by-pass.git package/by-pass

# Add luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
#git clone https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns

# Add luci-app-passwall
#git clone -b main https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2

./scripts/feeds update -a
./scripts/feeds install -a 
