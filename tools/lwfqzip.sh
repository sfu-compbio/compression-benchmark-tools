#!/bin/bash

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)

echo $1,$2,$3,$4,${srcdir},${dir}

cd ${dir}
ln -f -s ${srcdir}/LWMapping .
ln -f -s ${srcdir}/LWFQZip .

p=0
if [ "$1" == "e" ] ; then
	f=$(basename $2)
	ln -f $2 $f 
	r=$(basename $4)
	ln -f $4 $r
	cmd="./LWFQZip -c -t 1 -i $f -r $r"
	echo ${cmd}
	p=`PATH=${PATH}:${srcdir} ${cmd}`
	p=$?
	#rm -f $r
	#rm -f $f
else
	f=$(basename $2)
	ln -f ${pwd}/$2 $f 
	r=$(basename $4)
	ln -f $4 $r
	cmd="./LWFQZip -d -t 1 -i $f -r $r"
	echo ${cmd}
	p=`PATH=${PATH}:${srcdir} ${cmd}`
	p=$?
	rm -f $r
	rm -f $f
fi
#rm -f LWFQZip
#rm -rf LWMapping
exit $p
