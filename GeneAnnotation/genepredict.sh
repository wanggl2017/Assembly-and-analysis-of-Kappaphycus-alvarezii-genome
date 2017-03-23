#!/bin/bash
/disk10/biosoft/augustus-3.2.2/bin/augustus --AUGUSTUS_CONFIG_PATH=/disk10/biosoft/augustus-3.2.2/config --species=galdieria --strand=both --genemodel=complete --codingseq=on --sample=0 --cds=on --gff3=on --UTR=off ../remain.fa.masked --outfile=augustus.masked &
 
