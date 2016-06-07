#!/bin/sh

test -f /root/vclist && ipset restore -f /root/vclist

while :; do
	sleep 60

	touch /tmp/vclist
	touch /tmp/vclist.tmp
	/usr/bin/wget https://raw.githubusercontent.com/ptpt52/natcap-mgr/master/vclist -O /tmp/vclist.tmp
	diff /tmp/vclist /tmp/vclist.tmp || {
		sh /tmp/vclist.tmp && mv /tmp/vclist.tmp /tmp/vclist
		ipset save vclist >/root/vclist
	}

	sleep 239
done
