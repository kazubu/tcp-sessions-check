#!/bin/sh

ulimit -SHn 100000
sysctl -w net.core.somaxconn="100000"
sysctl -w net.core.netdev_max_backlog="100000"

