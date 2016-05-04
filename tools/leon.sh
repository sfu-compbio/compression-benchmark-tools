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
	ls -la
	t="$4"
	cmd="${srcdir}/build/leon -c -file $f -nb-cores $t -lossless"
	echo ${cmd}
	p=`${cmd} 2>&1`
	p=$?
	# for script size
	mv "$f.qual" "$f.leon.qual"
	rm -f $f
else
	f=$(basename $input)
	ln -f $input $f
	echo "${f%.*}"
	ln -f "${input}.qual" "${f%.*}.qual"
	t="$4"
	cmd="${srcdir}/build/leon -d -file $f -nb-cores $t"
	echo ${cmd}
	p=`${cmd}`
	p=$?

	q=$(basename $3)
	q=${q%.*}
	q=${q%.*}
	mv "$q.fastq.d" $(basename $3)
	rm -f $f
	rm -f "${f%.*}.qual"
fi
exit $p
