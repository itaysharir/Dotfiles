#! /usr/bin/env sh

ls -d /Applications/*.app \
      /System/Applications/*.app \
      /Applications/Utilities/*.app \
      /System/Applications/Utilities/*.app \
      | sed -r 's/^.+\///' | rev | cut -c5- | rev | dmenu -i | xargs -I {} open -a  "{}"
