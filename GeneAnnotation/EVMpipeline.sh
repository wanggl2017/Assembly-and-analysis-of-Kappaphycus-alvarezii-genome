#!/bin/bash
#Partitioning the Inputs
$EVM_HOME/EvmUtils/partition_EVM_inputs.pl --genome genome.fasta \
     --gene_predictions gene_predictions.gff3 --protein_alignments protein_alignments.gff3 \
     --transcript_alignments transcript_alignments.gff3 \
     --segmentSize 100000 --overlapSize 10000 --partition_listing partitions_list.out

#Generating the EVM Command Set
$EVM_HOME/EvmUtils/write_EVM_commands.pl --genome genome.fasta --weights `pwd`/weights.txt \
      --gene_predictions gene_predictions.gff3 --protein_alignments protein_alignments.gff3 \
      --transcript_alignments transcript_alignments.gff3 \
      --output_file_name evm.out  --partitions partitions_list.out >  commands.list


#If you would must run the commands serially and locally, run the following:
$EVM_HOME/EvmUtils/execute_EVM_commands.pl commands.list | tee run.log


#Combining the Partitions
$EVM_HOME/EvmUtils/recombine_EVM_partial_outputs.pl --partitions partitions_list.out --output_file_name evm.out

#Convert to GFF3 Format

$EVM_HOME/EvmUtils/convert_EVM_outputs_to_GFF3.pl  --partitions partitions_list.out --output evm.out  --genome genome.fasta
#After running the above script, an evm.out.gff3 file will exist in each of the contig directories.

#You can combine these gff3 files into a single output file like so:
find . -regex ".*evm.out.gff3" -exec cat {} \; > EVM.all.gff3

