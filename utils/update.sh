#!/bin/bash
set -e

skip_tasks=""
if [ "$1" = "--skip" ]; then
    skip_tasks=$2
fi

CURRENT_FOLDERS=$(cat "$TOOLS_FILE")

pushd "$TOOLS" >/dev/null
for folder in $CURRENT_FOLDERS; do
    if ! should_skip "$folder"; then
        update="${folder}/update"
        [[ -f $update ]] && sh $update
    fi
done

popd >/dev/null