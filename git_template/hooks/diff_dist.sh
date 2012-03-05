#!/usr/bin/env sh

# File extension to check for changes
OBSERVE='dist'

# check if user configured mergetool
mergetool=`git config --get merge.tool`
if [[ -n "$mergetool" ]]; then
    PROG=$mergetool
else
    PROG='vimdiff'
fi

# get a list of files changed by the merge
changes=`git diff --name-only HEAD@{1} HEAD`

do_diff()
{
    distfile=$1
    configfile=${distfile%.*}

    echo "$1 has changed since the merge. Open the diff? (y n q) "

    while true; do
        read action
        case $action in
            y)
                $PROG $distfile $configfile
                return
                ;;
            n)
                return
                ;;
            q)
                exit 0
                ;;
            *)
                echo "Unknown action"
                ;;
        esac
    done
}

for line in $changes
do
    filename=$(basename "$line")
    extension=${filename##*.}
    if [[ "$extension" == "$OBSERVE" ]]; then
        do_diff $line
    fi
done

exit 0
