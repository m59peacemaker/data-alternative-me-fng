#!/bin/sh

set -e

./lib/update-local-data.mjs && ./lib/commit-data.sh
