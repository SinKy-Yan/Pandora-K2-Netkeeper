#!/bin/sh

uci set network.wan=interface
uci set network.wan.ifname=$(uci show network.wan.ifname | awk -F "'" '{print $2}')
uci set network.wan.proto=pppoe
uci set network.wan.username=username
uci set network.wan.password=password
uci set network.wan.metric='0'
uci set network.wan.auto='0'
uci commit network

/etc/init.d/network reload
/etc/init.d/network restart

#enable \r in PPPoE
cp /lib/netifd/proto/ppp.sh /lib/netifd/proto/ppp.sh_bak
sed -i '/proto_run_command/i username=`echo -e "$username"`' /lib/netifd/proto/ppp.sh

#set init script
chmod -R 755 /etc/init.d/nk4
/etc/init.d/nk4 enable
reboot
