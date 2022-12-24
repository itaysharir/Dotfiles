#! /usr/bin/env sh

. ~/.config/dmenu-scripts/config.sh

ls -d /Applications/*.app \
      /System/Applications/*.app \
      /Applications/Utilities/*.app \
      /System/Applications/Utilities/*.app \
      | sed -r 's/^.+\///' | rev | cut -c5- | rev | ${DMENU_APPS} | xargs -I {} open -a  "{}"
