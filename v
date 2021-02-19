#!/bin/mksh
#
# print a command and run it. same as "set -x" for one command
#

function shellquote {
	REPLY=$1
	if [[ -z $1 || $1 == *[!A-Za-z0-9\-=/.,:]* ]]; then
		REPLY=\'${REPLY//\'/\'\\\'\'}\'
	fi
}
function shellquote_cmd {
	typeset arg
	for arg; do
		REPLY+=${REPLY:+ }${|shellquote "$arg"}
	done
}
print -ru2 -- + "${|shellquote_cmd "$@"}"
exec command -- "$@"
