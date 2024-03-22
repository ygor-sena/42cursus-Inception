#!/usr/bin/env bash

# This script is used to configure Redis cache settings.

# Set vm.overcommit_memory to 1 to allow Redis to allocate memory more than the system's total memory.
sysctl vm.overcommit_memory=1

# Disable transparent huge pages to improve Redis performance.
echo never > /sys/kernel/mm/transparent_hugepage/enabled

# Execute the provided command-line arguments along with the following Redis configuration options:
# --protected-mode no: Disable Redis protected mode.
# --bind 0.0.0.0: Bind Redis to all available network interfaces.
# --maxmemory 100mb: Set the maximum memory limit for Redis to 100 megabytes.
# --maxmemory-policy allkeys-lru: Use the LRU (Least Recently Used) algorithm to evict keys when the memory limit is reached.
exec "$@" \
	--protected-mode no \
	--bind 0.0.0.0 \
	--maxmemory 100mb \
	--maxmemory-policy allkeys-lru
