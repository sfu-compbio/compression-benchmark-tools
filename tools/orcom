#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $1,$2,$3,$4
if [ "$1" == "e" ] ; then
	b=${4%.*}
	b="${b}.obin"
	echo $b
	echo "${DIR}/orcom_bin  e -v -t$2 -f\"$3\" -o$b && ${DIR}/orcom_pack e -v -t$2 -i$b -o$4"
	${DIR}/orcom_bin  e -v -t$2 -f"$3" -o"$b" && ${DIR}/orcom_pack e -v -t$2 -i"$b" -o"$4"
else
	echo "${DIR}/orcom_pack d -v -t$2 -i$3 -o$4"
	${DIR}/orcom_pack d -v -t$2 -i$3 -o$4
fi
