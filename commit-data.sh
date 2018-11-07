#!/bin/sh

set -e

git config user.email "travis@travis-ci.org"
git config user.name "Travis CI"

if [[ -z $(git status fng.yaml -s) ]]; then
	echo 'comitting new data to git...'
	git add fng.yaml
	git commit -m "FnG data update `date --iso-8601=minutes`"
	git remote add data https://${GH_TOKEN}@github.com/m59peacemaker/alternative-me-fng-data.git > /dev/null 2>&1
	git push --quiet -u data master
fi
