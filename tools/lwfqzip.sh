#!/bin/bash
# Usage: 
#  $1=<compression mode:e or d> 
#  $2=<fastq> 
#  $3=<output>
#  $4=<reference>

pwd=`pwd`
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dir=$(dirname $3)

input="$2"
if [ "${input:0:1}" != "/" ]; 
then
	input="${pwd}/$input"
fi
reference="$4"
if [ "${reference:0:1}" != "/" ]; 
then
	ref="${pwd}/$reference"
fi
echo "Parameters: ",$1,$input,$3,$reference,${srcdir},${dir}

# symlink LW-FQZip binaries
cd ${dir}
ln -f -s ${srcdir}/LWMapping .
ln -f -s ${srcdir}/LWFQZip .

exit_code=0

if [ "$1" == "e" ] ; then
	file=$(basename $2)
	# LW-FQZip doesm't like .fq extensions: make sure it is .fastq
	file="${file%.*}.fastq"
	ref=$(basename $reference)
	ln -f $input $file
	ln -f $reference $ref

	PATH=${PATH}:. LWFQZip -c -t 1 -i $file -r $ref
	exit_code=$?
	
	rm -f $ref
	rm -f $file
else
	input=${input%.*}
	input="${input%.*}.fastq.lz"
	file=$(basename $input)
	
	ref=$(basename $reference)
	ln -f $input $file
	ln -f $reference $ref

	PATH=${PATH}:. LWFQZip -d -t 1 -i $file -r $ref
	exit_code=$?

	rm -f $ref 
	rm -f $file
fi

rm -f ${dir}/LWFQZip
rm -f ${dir}/LWMapping

exit $exit_code
