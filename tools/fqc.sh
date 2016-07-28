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
echo "Parameters: ",$1,$input,$3,$4,${srcdir},${dir}

# symlink LW-FQZip binaries
cd ${dir}
ln -f -s ${srcdir}/fqc .
ln -f -s ${srcdir}/fcompfastq .
ln -f -s ${srcdir}/fdecompfastq .

exit_code=0

if [ "$1" == "e" ] ; then
	file=$(basename $2)
	# FQC doesm't like .fq extensions: make sure it is .fastq
	file="${file%.*}.fastq"
	ln -f $2 $file
	
	PATH=${PATH}:. fqc -c -i $file -o $(basename $3)
	exit_code=$?
	
	rm -f $file
else
	#input=${input%.*}
	#input="${input%.*}.fastq.fqc"
	file=$(basename $input)
	ln -f $input $file
	
	PATH=${PATH}:. fqc -d -i $file -o $(basename $3)
	exit_code=$?
	
	rm -f $file
fi

rm -f ${dir}/fqc
rm -f ${dir}/fcompfastq
rm -f ${dir}/fdecompfastq

exit $exit_code