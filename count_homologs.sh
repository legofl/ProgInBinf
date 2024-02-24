#!usr/bin/bash

# blastn -query <query fasta file> -subject <subject fasta file> -task <task> -outfmt <desired format> [-out <outfile>]

# Given a protein sequence query, perform a blast search against a nucleotide subject
tblastn -query $1 -subject $2 -outfmt '6 std qlen' -task tblastn | awk '$3>30 &&$4>($13*0.9)' > $3

count=$(cat $3 | wc -l)
echo "$count"

