#!/bin/sh

set -e

git config user.email "travis@travis-ci.org"
git config user.name "Travis CI"

if [ -n "`git status fng.yaml -s`" ]; then
	echo 'comitting new data to git...'
	git add fng.yaml
	git commit -m "FnG data update `date --iso-8601=minutes` [ci skip]"
	git remote add data https://${GITHUB_TOKEN}@github.com/m59peacemaker/data-alternative-me-fng.git > /dev/null 2>&1
	git push --quiet data master
fi
