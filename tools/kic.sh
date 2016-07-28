#!/bin/bash
# Usage: 
#  $1=<compression mode:e or d> 
#  $2=<fastq> 
#  $3=<output>
#  $4=<number of threads> 

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)

input="$2"
if [ "${input:0:1}" != "/" ]; 
then
	input="${pwd}/$input"
fi
echo "Parameters: ",$1,$input,$3,$4,${srcdir},${dir}

cd ${dir}
exit_code=0

if [ "$1" == "e" ] ; then
	file=$(basename $input)
	ln -f $input $file
	threads="$4"
	
	java -Xmx2000m -jar ${srcdir}/kic.jar $file -n $threads 2>&1
	exit_code=$?

	rm -f $file
else
	file=$(basename $input)
	ln -f $input $file
	ln -f "${input}.name" "${file}.name"
	ln -f "${input}.qual" "${file}.qual"
	ln -f "${input}.seq"  "${file}.seq"

	java -Xmx2000m -jar ${srcdir}/kid.jar $file
	exit_code=$?

	rm -f ${f}
	rm -f "${f}.name"
	rm -f "${f}.qual"
	rm -f "${f}.seq"
fi

exit $exit_code
