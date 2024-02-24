#!/usr/bin/env python3

'''
Week 6 Exercise
'''

import sys

# open file we are working with
file = open(sys.argv[1], "r")

# start by reading in lines 
sequences = file.readlines()
seq = []
seq1 = ""
seq2 = ""

for line in sequences:
    if line[0]=='>':
        # do nothing
        continue
    else:  # only record every other line, since some are sequence names
        seq.append(line.strip())
seq1 = seq[0]
seq2 = seq[1]

# now compare the sequences
pipe = "" # this will hold the pipe or spaces to be printed
for i in range(len(seq1)):
    if(seq1[i] == seq2[i]): # if equal, print pipe
        pipe+="|"
    else: # if not equal, print space
        pipe+=" "

# print output
print(seq1)
print(pipe)
print(seq2)

# close file
file.close()
