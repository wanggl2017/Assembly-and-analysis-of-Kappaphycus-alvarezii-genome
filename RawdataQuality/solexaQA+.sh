#!/bin/bash

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ dynamictrim ${Myraw}_1.fastq ${i}_2.fastq -h 20 -d . 

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ lengthsort ${i}_1.fq.trimmed ${i}_2.fq.trimmed -l 50 -d . 

/disk10/biosoft/SolexaQA+/Linux_x64/SolexaQA++ analysis S97_03A_CHG003013-YJK15I003-GY_L007_R1.fastq.trim.tidy.fq S97_03A_CHG003013-YJK15I003-GY_L007_R2.fastq.trim.tidy.fq -d solexaqa/ 
