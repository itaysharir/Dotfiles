#! /usr/bin/env sh

# get config
. ~/.config/dmenu-scripts/config.sh

# list options
choice=$(printf \
         "amazon - https://amazon.com/s?k=\\
google - https://google.com/search?client=firefox-b-d&q=\\
github - https://github.com/search?q=\\
gitlab - https://gitlab.com/search?search=\\
reddit - https://reddit.com/search/?q=\\
stackoverflow - https://stackoverflow.com/search?q=\\
youtube - https://youtube.com/results?search_query=\\
archive - https://web.archive.org/web/*/\\
wikipedia - https://en.wikipedia.org/wiki/\
"\
| sed 's/\\//' | ${DMENU} "Search:") # pipe options into dmenu

website=$(echo $choice | cut -d- -f1) # store the name of website in a variable (example: amazon)
final=$(echo $choice | cut -d "-" -f2-) # store blank serch link to selected website in a variable

# check if choice is empty
if [ -z "$choice" ]; then
    exit # if it is, exit
else
    search=$(cd | ${DMENU} "Enter search query for $website") # if not, ask the user for search query
    open ${final}"${search}"                                    # and then search what the user typed on the wsbsite he selected
fi
