#!/bin/bash
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P INPUT ACCEPT
iptables -t filter -F INPUT
iptables -t filter -F OUTPUT
