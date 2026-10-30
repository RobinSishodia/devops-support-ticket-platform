#!/bin/bash

echo "=== SERVER HEALTH REPORT ==="

echo "Disk space:"
df -h /

echo
echo "Memory:"
free -h

echo
echo "Uptime and workload:"
uptime
