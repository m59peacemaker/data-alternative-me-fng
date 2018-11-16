#!/bin/sh

set -e

if [ "${TRAVIS}" = "true" ]; then
	git config user.email "travis@travis-ci.org"
	git config user.name "Travis CI"
fi

if [ -n "`git status fng.yaml -s`" ]; then
	echo 'bumping package version...'
	npm --no-git-tag-version version patch

	echo 'comitting new data to git...'
	git checkout master
	git add fng.yaml
	git commit -m "data update"
	git remote add data https://${GITHUB_TOKEN}@github.com/m59peacemaker/data-alternative-me-fng.git > /dev/null 2>&1
	git push --quiet data master
	./lib/trigger-dependants.sh
fi
