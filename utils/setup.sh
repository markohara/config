#!/bin/bash
set -e

should_skip() {
    local task=$1
    [[ $skip_tasks =~ (^|,)$task(,|$) ]]
}

skip_tasks=""
if [ "$1" = "--skip" ]; then
    skip_tasks=$2
fi

CURRENT_FOLDERS=$(cat "$TOOLS_FILE")

pushd "$TOOLS" >/dev/null
for folder in $CURRENT_FOLDERS; do
    if ! should_skip "$folder"; then
        setup="${folder}/setup"
        [[ -f $setup ]] && sh $setup
    fi
done

for folder in $CURRENT_FOLDERS; do
    if ! should_skip "$folder"; then
        configure="${folder}/configure"
        [[ -f $configure ]] && sh $configure
    fi
done

popd >/dev/null