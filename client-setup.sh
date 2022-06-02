#!/bin/sh

ulimit -SHn 100000
sysctl -w net.ipv4.ip_local_port_range="2048 65535"

