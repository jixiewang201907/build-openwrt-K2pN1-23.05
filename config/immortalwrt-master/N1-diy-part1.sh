#!/bin/bash
cd openwrt
# wireless
rm -rf files/etc/config/wireless
rm -rf files/etc/modules.d/wireless_enable

# geodata
wget -q -cp files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -q -cp files/usr/share/v2ray https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat

# add kenzok8
sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
echo "src-git SSRplus https://github.com/fw876/helloworld.git;master" >> "feeds.conf.default"

# Add luci-theme-opentomcat,Add luci-theme-argon
#git clone https://github.com/jixiewang201907/luci-theme-opentomcat.git package/luci-theme-opentomcat
#git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# add passwall2
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> "feeds.conf.default"

# Add amlogic
#git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic

# Add luci-app-passwall
#git clone -b main https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall
#git clone -b main https://github.com/xiaorouji/openwrt-passwall2.git package/luci-app-passwall2

# Add luci-app-bypass
#git clone https://github.com/jixiewang201907/by-pass.git package/by-pass

# Add luci-app-smartdns
#git clone https://github.com/pymumu/openwrt-smartdns.git feeds/packages/net/smartdns
#git clone https://github.com/pymumu/luci-app-smartdns.git feeds/luci/applications/luci-app-smartdns

# Add luci-app-adguardhome
#git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/luci-app-adguardhome

./scripts/feeds update -a
./scripts/feeds install -a
