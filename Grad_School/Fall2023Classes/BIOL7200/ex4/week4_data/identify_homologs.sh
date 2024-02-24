#!/usr/bin/bash

# name incoming files
query=$1
subject=$2
bed=$3
output=$4
blast_hits=$(mktemp) # make temporary file

# Given a protein sequence query, perform a blast search against a nucleotide subject 
tblastn -query $query -subject $subject -outfmt '6 std qlen' -task tblastn | awk '$3>30 && $4>($13*0.9)' > $blast_hits

# read in blast_hits file
while read a b c d e f g h sblast eblast m n o 
do
	# read in bed file
	while read sid sbed ebed sname p q
	do
		# compare start and end of sequences
		if [[ $sblast -gt $sbed ]] && [[ $eblast -le $ebed ]] 
		then
		# print to output file
		printf '%s\n' $sname >> $output
		fi
	done < $bed
done < $blast_hits

# use sort -u to remove repeats in output file
sort -u $output -o $output

# remove temp file
rm $blast_hits








