build:
	docker build -t sous/freeswitch .

install:
	apt-get install minissdpd miniupnpd uuid
	grep -e ^MiniUPnPd_EXTERNAL_INTERFACE /etc/default/miniupnpd || echo 'MiniUPnPd_EXTERNAL_INTERFACE="eth0"' >> /etc/default/miniupnpd
	grep -e ^MiniUPnPd_LISTENING_IP /etc/default/miniupnpd || echo 'MiniUPnPd_LISTENING_IP="docker0"' >> /etc/default/miniupnpd
	grep -e ^START_DAEMON=1 /etc/default/miniupnpd || echo 'START_DAEMON="1"' >> /etc/default/miniupnpd
	grep -e ^MiniUPnPd_OTHER_OPTIONS /etc/default/minipnpd || echo 'MiniUPnPd_OTHER_OPTIONS="-p 0 -N -U -B 1000000000 1000000000 -A allow 1024-65535 172.17.0.0/16 1024-65535 -t 10 -u `uuid` -s 12345678 -m 1 -r 0"' >> /etc/default/miniupnpd
	/etc/miniupnpd/iptables_init.sh
	/etc/init.d/miniupnpd restart

freeswitch:
	[ -d /volumes/freeswitch ] || mkdir -p /volumes/freeswitch
	docker run --name freeswitch -v /volumes/freeswitch:/opt/freeswitch/etc -d sous/freeswitch
