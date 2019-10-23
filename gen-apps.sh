#!/bin/bash

# THIS SCRIPTS GENERATES A LIST OF APPS FOR SJ-LAUNCHER

IFS=$'\n'

# GENERATE LIST OF GRAPHICAL PROGRAMS
gs="$(grep -RlL Terminal=true /usr/share/applications/)"
for file in $gs; do
	i=0
	name=($(grep ^Name= $file | cut -d= -f2-))
	for entry in $(grep ^Exec= "$file" | cut -d= -f2-); do
		as=$"${as}g ${name[$i]} - $entry\n"
		let i++
	done
done

# GENERATE LIST OF GRAPHICAL PROGRAMS
ts="$(grep -Rl Terminal=true /usr/share/applications/)"
for file in $ts; do
	i=0
	name=($(grep ^Name= $file | cut -d= -f2-))
	for entry in $(grep ^Exec= "$file" | cut -d= -f2-); do
		as=$"${as}t ${name[$i]} - $entry\n"
	done
done

unset IFS

# CLEAN UP AND SAVE
echo -e $as | sed -Ee 's/%[^ ]//g' | tr -s ' '  > $HOME/.data/apps
