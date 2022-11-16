#!/bin/bash

docker run -it \
-e DISPLAY=`echo $DISPLAY | sed 's/^[^:]*\(.*\)/172.17.0.1\1/'` \
-v ~/.Xauthority:/home/user/Xauthority \
gar-registry.caas.intel.com/virtiot/x11-test \
bash


sudo iptables \
  --table nat \
  --insert PREROUTING \
  --proto tcp \
  --destination 172.17.0.1 \
  --dport 6010 \
  --jump DNAT \
  --to-destination 127.0.0.1:6010
sudo sysctl net.ipv4.conf.docker0.route_localnet=1
