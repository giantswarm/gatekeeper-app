#!/bin/bash
#
# This script generate the gatekeeper helm chart
# It does so by pulling the upstream chart and apply patches on top

# Gatekeeper upstream git repository url
upstream_repo_url="https://github.com/open-policy-agent/gatekeeper.git"

# Path to helm chart in the gatekeeper upstream repository
upstream_chart_path="chart/gatekeeper-operator/"

# Path to helm chart in this repository, relative to this script
local_chart_path="../helm/gatekeeper-app/"
# Path to patch files in this repository, relative to this script
patch_files="../patch/*.patch"

# Path to ignored files list, relative to this script
ignored_files="ignored_files"

# Exit on error
set -e
# Expand filename pattern to null when no files are found
shopt -s nullglob

script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P)"
tmp=$(mktemp -d)
# Clean temporary directory on exit
trap "rm -rf $tmp" EXIT

echo "=====> fetching upstream chart"
git clone $upstream_repo_url $tmp

echo "=====> syncing chart"
rsync -av --delete --exclude-from=$script_path/$ignored_files $tmp/$upstream_chart_path $script_path/$local_chart_path

echo "=====> patching chart"
for file in $script_path/$patch_files; do
    patch -p1 -d $script_path/$local_chart_path < $file
done

echo "=====> done"