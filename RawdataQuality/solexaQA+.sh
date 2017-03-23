#!/bin/bash

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ analysis ${Myraw}_1.fastq ${Myraw}_2.fastq -d solexaqa/ 

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ dynamictrim ${Myraw}_1.fastq ${Myraw}_2.fastq -h 20 -d solexaqa/ 

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ lengthsort ${Myraw}_1.fastq.trimmed ${Myraw}_2.fastq.trimmed -l 50 -d . 

