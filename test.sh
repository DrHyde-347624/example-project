#!/usr/bin/env bash

STATUS=0

function main {
    ok "$(./makelink.sh)" "provide two arguments" "Called with no args, it whines"

    ./makelink.sh foo bar
    ok "$([ -f foo ];echo $?)" "0" "Created file 'foo'"
    ok "$([ -L bar ];echo $?)" "0" "Created symlink 'bar'"
}

function ok {
    local got=$1
    local expected=$2
    local message=$3
    if [ "$1" != "$2" ]; then
        echo "not ok $message"
        STATUS=1
    else
        echo "ok $message"
    fi
}

main
rm foo bar
exit $STATUS
