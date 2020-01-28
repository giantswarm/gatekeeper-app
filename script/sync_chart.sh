#!/bin/bash

# Exit on error
set -e

# Expand filename pattern to null when no files are found
shopt -s nullglob

UPSTREAM_REPO_URL="https://github.com/open-policy-agent/gatekeeper.git"
UPSTREAM_CHART_PATH="chart/gatekeeper-operator/"

LOCAL_CHART_PATH="../helm/gatekeeper-app/"
PATCH_FILES="$SCRIPT_PATH/../patch/*.patch"

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

echo "=====> fetching upstream chart"
git clone $UPSTREAM_REPO_URL $TMP

echo "=====> syncing chart"
rsync -av --delete --exclude-from=$SCRIPT_PATH/ignored_files $TMP/$UPSTREAM_CHART_PATH $SCRIPT_PATH/$LOCAL_CHART_PATH

echo "=====> patching chart"
for file in $PATCH_FILES; do
    patch -d helm/gatekeeper-app/templates < $file
done
