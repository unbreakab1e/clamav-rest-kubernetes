#!/bin/env bash

set -e

if freshclam | grep -q 'bytecode.cvd already up-to-date'; then
  echo "freshclam is running"
else
  echo "freshclam is not running"
  exit 1
fi