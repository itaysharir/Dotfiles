#!/bin/env sh

file="$HOME/.todo"
touch "$file"
height=$(wc -l "$file" | awk '{print $1}')
prompt="Add a task: "

cmd=$(dmenu -l "$height" -p "$prompt" "$@" < "$file")
while [ -n "$cmd" ]; do
 	if grep -q "^$cmd\$" "$file"; then
		grep -v "^$cmd\$" "$file" > "$file.$$"
		mv "$file.$$" "$file"
        height=$(( height - 1 ))
 	else
		echo "$cmd" >> "$file"
		height=$(( height + 1 ))
 	fi

	cmd=$(dmenu -l "$height" -p "$prompt" "$@" < "$file")
done

exit 0
