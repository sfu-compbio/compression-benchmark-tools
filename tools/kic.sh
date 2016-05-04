#!/bin/bash

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)

input="$2"
if [ "${input:0:1}" != "/" ]; 
then
	input="${pwd}/$input"
fi
echo $1,$input,$3,$4,${srcdir},${dir}

cd ${dir}
p=0
if [ "$1" == "e" ] ; then
	f=$(basename $input)
	ln -f $input $f
	t="$4"
	cmd="java -Xmx2000m -jar ${srcdir}/kic.jar $f -n $t"
	echo ${cmd}
	p=`${cmd} 2>&1`
	p=$?
	# for script size
	rm -f $f
else
	f=$(basename $input)
	ln -f $input $f
	ln -f "${input}.name" "${f}.name"
	ln -f "${input}.qual" "${f}.qual"
	ln -f "${input}.seq"  "${f}.seq"
	ls

	t="$4"
	cmd="java -Xmx2000m -jar ${srcdir}/kid.jar $f"
	echo ${cmd}
	p=`${cmd}`
	p=$?

	rm -f ${f}
	rm -f "${f}.name"
	rm -f "${f}.qual"
	rm -f "${f}.seq"
fi
exit $p
