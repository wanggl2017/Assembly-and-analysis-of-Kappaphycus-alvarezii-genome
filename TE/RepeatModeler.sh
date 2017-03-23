#!/bin/bash
/disk10/biosoft/RepeatModeler/BuildDatabase -name remain -engine ncbi remain.fa 
/disk10/biosoft/RepeatModeler/RepeatModeler -engine ncbi -pa 32 -database remain >& run.out 
