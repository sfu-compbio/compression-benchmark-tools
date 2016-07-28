#!/bin/bash
#  $1=<compression mode:e or d> 
#  $2=<threads> 
#  $3=<input>
#  $4=<output>

srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Parameters",$1,$2,$3,$4

exit_code=0
if [ "$1" == "e" ] ; then
	output="${4%.*}.obin"
	
	${srcdir}/orcom_bin  e -v -t$2 -f"$3" -o"$output"
	exit_code=$?
	if [ $exit_code -ne 0 ]; then
		exit $exit_code
	fi
	
	${srcdir}/orcom_pack e -v -t$2 -i"$output" -o"$4"
	exit_code=$?
else
	${srcdir}/orcom_pack d -v -t$2 -i$3 -o$4
	exit_code=$?
fi

exit $exit_code