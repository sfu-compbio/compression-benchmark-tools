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
	${srcdir}/leon -c -file $file -nb-cores $threads -lossless 2>&1
	exit_code=$?
	
	# Fix Leon's quality score naming
	mv "$file.qual" "$file.leon.qual" 
	rm -f $file
else
	file=$(basename $input)
	ln -f $input $file
	ln -f "${input}.qual" "${file%.*}.qual"
	
	threads="$4"
	${srcdir}/leon -d -file $file -nb-cores $threads
	exit_code=$?

	# Make sure that Leon's .fastq.d files get named as .fastq file
	output=$(basename $3)
	q=${output%.*} # output
	q=${q%.*}
	mv "$q.fastq.d" $output
	rm -f $file
	rm -f "${f%.*}.qual"
fi

exit $exit_code
