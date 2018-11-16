#!/bin/sh

set -e

repos=" \
	pine-alternative-me-fng \
"

for repo in $repos; do
	repo_url="https://api.travis-ci.org/repo/m59peacemaker%2F${repo}/requests"

	echo "triggering ci build for ${repo}..."

	curl -s -X POST \
		-H "Content-Type: application/json" \
		-H "Accept: application/json" \
		-H "Travis-API-Version: 3" \
		-H "Authorization: token ${TRAVIS_CI_API_TOKEN}" \
		-d '{ "request": { "branch": "master" } }' \
		${repo_url}
done
