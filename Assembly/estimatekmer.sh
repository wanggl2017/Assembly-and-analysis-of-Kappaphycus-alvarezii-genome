#!/bin/bash

JF_SIZE=`ls -l *.fastq | awk '{n+=$5}END{s=int(n/50); if(s>40000000000)print s;else print "40000000000";}'`
save JF_SIZE
perl -e '{if(int('$JF_SIZE')>40000000000){print "WARNING: JF_SIZE set too low, increasing JF_SIZE to at least '$JF_SIZE', this automatic increase may be not 
enough!\n"}}'
log Creating mer database for Quorum.
quorum_create_database -t 16 -s $JF_SIZE -b 7 -m 24 -q $((MIN_Q_CHAR + 5)) -o quorum_mer_db.jf p1.renamed.fastq p2.renamed.fastq
if [ 0 != 0 ]; then
  fail Increase JF_SIZE in config file, the recommendation is to set this to genome_size*coverage/2
fi


quorum_error_correct_reads  -q $((MIN_Q_CHAR + 40)) --contaminant=/disk1/biosoft/MaSuRCA-3.2.1_08102016/bin/../share/adapter.jf -m 1 -s 1 -g 1 -a 3 -t 16 -w 
10 -e 3 -M  quorum_mer_db.jf p1.renamed.fastq p2.renamed.fastq --no-discard -o pe.cor --verbose 1>quorum.err 2>&1 || {
  mv pe.cor.fa pe.cor.fa.failed && fail Error correction of PE reads failed. Check pe.cor.log.
}

log Estimating genome size.
jellyfish count -m 17 -t 16 -C -s $JF_SIZE -o k_u_hash_0 pe.cor.fa
export ESTIMATED_GENOME_SIZE=`jellyfish histo -t 16 -h 1 k_u_hash_0 | tail -n 1 |awk '{print $2}'`
save ESTIMATED_GENOME_SIZE
echo "Estimated genome size: $ESTIMATED_GENOME_SIZE"
