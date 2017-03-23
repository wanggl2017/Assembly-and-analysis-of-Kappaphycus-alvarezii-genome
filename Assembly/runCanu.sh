#!/bin/bash

#First, correct the raw reads:

canu -correct \
  -p kpz -d kpz \
  genomeSize=400m \
  -pacbio-raw  merge.fastq

#Then, trim the output of the correction:

canu -trim \
  -p kpz -d kpz \
  genomeSize=400m \
  -pacbio-corrected correctedReads.fasta.gz

#And finally, assemble the output of trimming, twice:

canu -assemble \
  -p kpz -d kpz-erate-0.013 \
  genomeSize=400m \
  errorRate=0.013 \
  -pacbio-corrected trimmedReads.fasta.gz

canu -assemble \
  -p ecoli -d kpz-erate-0.025 \
  genomeSize=400m \
  errorRate=0.025 \
  -pacbio-corrected ecoli.trimmedReads.fasta.gz
