#!/bin/bash
/disk7/soft/augustus-3.2.2/bin/augustus --strand=both --genemodel=complete --AUGUSTUS_CONFIG_PATH=/disk7/soft/augustus-3.2.2/config --gff3=on --hintsfile=rnahint.gff --extrinsicCfgFile=extrinsic.MPE.cfg --species=galdieria ../remain.fa
