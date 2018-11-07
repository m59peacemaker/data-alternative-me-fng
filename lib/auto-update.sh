#!/bin/sh

set -e

if [ "$TRAVIS_EVENT_TYPE" != "cron" ]; then
	exit
fi

./lib/update-local-data.mjs && ./lib/commit-data.sh
