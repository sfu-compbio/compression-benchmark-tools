#!/bin/bash
# Usage: 
#  $1=<compression mode:e or d> 
#  $2=<fastq> 
#  $3=<output>
#  $4=<number of threads> 
#  $5=<paired end>

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
	out=$(basename $3)
	threads="$4"
	
	if [ -z "$5" ]; then
		${srcdir}/mince -e -r $file -p $threads -o $out 2>&1
	else
		echo "Paired-end mode"
		input2="$5"
		if [ "${input2:0:1}" != "/" ]; 
		then
			input2="${pwd}/$input2"
		fi
		file2=$(basename $input2)
		ln -f $input2 $file2
		${srcdir}/mince -e -1 $file -2 $file2 -p $threads -o $out 2>&1
	fi
	exit_code=$?

	rm -f $file
	if [ ! -z "$file2" ] ; then
		rm -f $file2
	fi	
else
	file=$(basename $input)
	ln -f "${input}.flips.lz" "${file}.flips.lz"
	ln -f "${input}.nlocs.lz" "${file}.nlocs.lz"
	ln -f "${input}.offs.lz"  "${file}.offs.lz"
	ln -f "${input}.seqs.lz"  "${file}.seqs.lz"
	out=$(basename $3)
	threads="$4"

	${srcdir}/mince -d -i $file -p $threads -o $out
	exit_code=$?

	rm -rf "${file}."*".lz"
fi

exit $exit_code
