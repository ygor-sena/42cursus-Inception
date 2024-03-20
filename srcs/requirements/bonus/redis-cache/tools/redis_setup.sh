#!/usr/bin/env bash

sysctl vm.overcommit_memory=1
echo never > /sys/kernel/mm/transparent_hugepage/enabled

exec "$@" \
  --protected-mode no \
  --bind 0.0.0.0 \
  --maxmemory 100mb \
  --maxmemory-policy allkeys-lru
