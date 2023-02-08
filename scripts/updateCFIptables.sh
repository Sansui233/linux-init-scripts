#!/bin/bash
accept-v4(){
  # iptables  -t filter -A INPUT -p tcp -m multiport --dports http,https -s $1 -j ACCEPT
  echo "-A INPUT -s $1 -p tcp -m multiport --dports http,https -j ACCEPT"
}

for i in $(curl https://www.cloudflare.com/ips-v4); do
  accept-v4 "$i"
done