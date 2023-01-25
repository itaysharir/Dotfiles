#! /usr/bin/env sh

osascript -e 'set targetFolder to POSIX file "/Users/itaysharir"

tell application "Finder"
    open targetFolder
    activate
end tell'
