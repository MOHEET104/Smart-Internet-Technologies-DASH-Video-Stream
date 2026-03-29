#!/bin/bash

# --- TBF ---
sudo tc qdisc del dev enp0s8 root 2>/dev/null
sudo tc qdisc add dev enp0s8 root tbf rate 2.5mbit burst 20k latency 50ms

# --- HTB ---
sudo tc qdisc del dev enp0s8 root 2>/dev/null
sudo tc qdisc add dev enp0s8 root handle 1: htb default 10
sudo tc class add dev enp0s8 parent 1: classid 1:1 htb rate 5mbit burst 20k
sudo tc class add dev enp0s8 parent 1:1 classid 1:10 htb rate 2.5mbit ceil 5mbit burst 20k

# --- Traffic Policing (run on CLIENT VM) ---
sudo tc qdisc add dev enp0s8 ingress
sudo tc filter add dev enp0s8 parent ffff: protocol ip u32 \
  match ip src 0.0.0.0/0 police rate 3.5mbit burst 20k drop flowid :1
