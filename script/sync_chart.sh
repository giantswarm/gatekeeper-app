#!/bin/bash
#
# This script generate the gatekeeper helm chart
# It does so by pulling the upstream chart and apply patches on top.

# Gatekeeper upstream git repository url
UPSTREAM_REPO_URL="https://github.com/open-policy-agent/gatekeeper.git"
# Path to helm chart in the gatekeeper upstream repository
UPSTREAM_CHART_PATH="chart/gatekeeper-operator/"

# Path to helm chart in this repository, relative to this script
LOCAL_CHART_PATH="../helm/gatekeeper-app/"
# Path to patch files in this repository, relative to this script
PATCH_FILES="../patch/*.patch"

# Exit on error
set -e
# Expand filename pattern to null when no files are found
shopt -s nullglob

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
TMP=$(mktemp -d)
trap "rm -rf $TMP" EXIT

echo "=====> fetching upstream chart"
git clone $UPSTREAM_REPO_URL $TMP

echo "=====> syncing chart"
rsync -av --delete --exclude-from=$SCRIPT_PATH/ignored_files $TMP/$UPSTREAM_CHART_PATH $SCRIPT_PATH/$LOCAL_CHART_PATH

echo "=====> patching chart"
for file in $SCRIPT_PATH/$PATCH_FILES; do
    patch -p1 -d helm/gatekeeper-app < $file
done

echo "=====> done"
