#!/bin/bash

export PATH=/opt/augustus-3.2.2/bin/:/opt/augustus-3.2.2/scripts/:$PATH
export AUGUSTUS_CONFIG_PATH="/opt/augustus-3.2.2/config/"

python BUSCO.py -i genome.fa -o output_kapa -l eukaryota -m geno -c 1
