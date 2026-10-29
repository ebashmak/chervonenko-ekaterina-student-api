#!/bin/bash

echo "================="
echo "Name: Chervonenko Ekaterina"
echo "Date"
date

echo "Username"
whoami

echo "Hostname"
hostname

echo "------------------"
echo "Operating system and kernel version"
uname -a

echo "------------------"
echo "CPU and memory information"
lscpu | grep "Model name"
echo "------------------"
echo "Memory information"
free -h

echo "Disk usage"
df -h /
echo "================="
