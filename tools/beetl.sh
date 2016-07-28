#!/bin/bash
# Usage: 
#  $1=<compression mode:e or d> 
#  $2=<fastq> 
#  $3=<output> 

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)

input="$2"
if [ "${input:0:1}" != "/" ]; 
then
	input="${pwd}/$input"
fi
echo "Parameters: ",$1,$input,$3,${srcdir},${dir}

cd ${dir}
exit_code=0

if [ "$1" == "e" ] ; then
	file=$(basename $input)
	ln -f $input $file
	out=$(basename $3)
	
	${srcdir}/beetl-bwt -i $file -o xbeetl --output-format ASCII --sap-ordering --algorithm ext 2>&1
	exit_code=$?

	# tar all BEETL output files to a single file
	# BEETL output files are prefixed with xbeetl-
	if [ $exit_code -eq 0 ]; then
		time tar cjvf ${out} xbeetl-* 
	fi
	rm -f $file
	rm -f xbeetl-*
else
	out=$(basename $3)
	
	time tar xjvf $input -C .
	${srcdir}/beetl-unbwt -i xbeetl -o $out --output-format fasta
	exit_code=$?

	rm -f xbeetl-*
fi

exit $exit_code
