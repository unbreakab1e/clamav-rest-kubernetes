#!/bin/env bash

set -e

if clamdscan eicar.com | grep -q 'Infected files: 1'; then
  echo "clamd is running"
  exit 0
else
  echo "clamd is not running"
  exit 1
fi

