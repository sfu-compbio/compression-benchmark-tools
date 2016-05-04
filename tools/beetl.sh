#!/bin/bash

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)


input="$2"
if [ "${input:0:1}" != "/" ]; 
then
	input="${pwd}/$input"
fi
echo $1,$input,$3,${srcdir},${dir}

cd ${dir}
p=0
if [ "$1" == "e" ] ; then
	f=$(basename $input)
	ln -f $input $f
	out=$(basename $3)
	cmd="${srcdir}/beetl-bwt -i $f -o xbeetl --output-format ASCII --sap-ordering --algorithm ext"
	echo ${cmd}
	p=`${cmd} 2>&1`
	p=$?

	if [ $p -eq 0 ]; then
		time tar cjvf ${out} xbeetl-* 
	fi
	# for script size
	rm -f $f
	rm -f xbeetl-*
else
	f=$(basename $input)
	time tar xjvf $input -C .
	out=$(basename $3)
	cmd="${srcdir}/beetl-unbwt -i xbeetl -o $out --output-format fasta"
	echo ${cmd}
	p=`${cmd}`
	p=$?

	rm -f xbeetl-*
fi
exit $p
