#!/bin/sh -l

set -u

echo "$3" > .githubtoken
unset GITHUB_TOKEN

gh auth login --with-token < .githubtoken
rm .githubtoken

gh api \
    repos/$GITHUB_REPOSITORY/deployments/$1/statuses \
    -H "Accept: application/vnd.github.ant-man-preview+json" \
    -f state=$2