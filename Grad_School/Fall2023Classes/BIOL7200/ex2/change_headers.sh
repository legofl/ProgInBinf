#!/usr/bin/bash

# get accession number
acc_num=$(echo $1 | sed 's/[^0-9]*//g')

# use sed to add accession number
sed "s/>/>$acc_num/" $1 > $2
