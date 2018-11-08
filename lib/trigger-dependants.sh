#!/bin/sh

set -e

repos=" \
	pine-alternative-me-fng \
"
for repo in $repos; do
	curl -s -X POST \
		-H "Content-Type: application/json" \
		-H "Accept: application/json" \
		-H "Travis-API-Version: 3" \
		-H "Authorization: token $TRAVIS_CI_API_TOKEN" \
		-d '{ "request": { "branch": "master" } }' \
		https://api.travis-ci.com/repo/m59peacemaker%2F$repo/requests
done
