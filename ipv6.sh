#!/bin/bash

cd "$(dirname "$0")"
while read var value
do
    export "$var"="$value"
done < config
regex='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'

if [[ $ipv6addr =~ $regex ]]; then
    echo $ipv6addr
else
    echo "no valid ipv6 address"
fi

if [[ $ipv6gtwy =~ $regex ]]; then
    echo $ipv6gtwy
else
    echo "no valid ipv6 gateway"
fi

ip -6 addr add $ipv6addr dev $dev
ping6 -c2 -I ens2 ff02::1
ip -6 route add $ipv6gtwy dev $dev
ip -6 route add default via $ipv6gtwy dev $dev
