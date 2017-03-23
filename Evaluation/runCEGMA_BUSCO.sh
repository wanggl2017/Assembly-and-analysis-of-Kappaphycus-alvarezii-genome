#!/bin/bash

export WISECONFIGDIR=/path/to/wise2.2.0/wisecfg 
export PATH=/path/to/wise2.2.0/src/bin:$PATH
export PATH=/path/to/BUSCO/CEGMA_v2.5/geneid/bin:$PATH
export PATH=/path/to/hmmer-3.1b1-linux-intel-x86_64/binaries/:$PATH
export PATH=/path/to/BUSCO/CEGMA_v2.5/bin:$PATH

 cegma -g genome.fa -p core.fa -T 32 


export PATH=/path/to/augustus-3.2.2/bin/:/opt/augustus-3.2.2/scripts/:$PATH
export AUGUSTUS_CONFIG_PATH="/opt/augustus-3.2.2/config/"

python BUSCO.py -i genome.fa -o output_kapa -l eukaryota -m geno -c 1
