# Assembly-and-analysis-of-Kappaphycus-alvarezii-genome


Workflow

Data accession
All of the raw reads has been deposited at SRA under the accession SRP101845. This Whole Genome Shotgun project has been deposited at DDBJ/ENA/GenBank under the accession NADL00000000. The version described in this paper is version NADL01000000. The raw sequence data has also been deposited in the Genome Sequence Archive in BIG Data Center , Beijing Institute of Genomics (BIG), Chinese Academy of Sciences, under accession numbers PRJCA000373 that are publicly accessible at http://bigd.big.ac.cn/gsa. 

Estimation of the genome size and hybrid de novo genome assembly
Genome sizes were estimated by the k-mer-based method in Jellyfish program. K-mer analysis was performed by using 34.15 Gb clean sequences from 300 and 500 bp insert size libraries
  De novo genome assembly of uncorrected PacBio reads was performed using Canu [9] with the default parameters to yield the primary assembly. The contig graph from canu.gfa file of primary assembly was used to check relatedness of contig connections and to improve the assembly. 
  
Evaluation of the completeness of the genome assembly
To evaluate the completeness of the assembly, a set of ultra-conserved core eukaryotic genes identified by CEGMA were mapped to the assembled genome using CEGMA and a new tool BUSCO, which quantitatively assess genome completeness using evolutionarily informed expectations of gene content.

Repeat annotation of the genome assembly
We used two methods to identify the repeat contents in K. alvarezii genome, homology-based and de novo prediction. The homology-based analysis was performed by RepeatMasker using RepBase. In de novo prediction, RepeatMasker(version 3.3.0) was used to identify transposable repeats in the genome with a de novo repeat library that constructed by RepeatModeler.

Gene prediction and functional annotation
Approaches for gene model prediction, which includes homology detection, expression evidence based predictions and ab initio gene predictions, were then combined to get consensus gene structures. To identify homology patterns in K. alvarezii, the BLASTX search was conducted against the NCBI non-redundant protein database with E-value <10-5, and then the proteins were aligned for precise structure by genewise, allowing for introns and frameshifting errors. For expression evidences, published ESTs, transcripts and RNA-seq datasets were aligned to the genome. After measuring and comparing a variety of programs, AUGUSTUS was used for ab initio gene prediction. Gene model parameters for the programs were trained from long transcripts and known Kappaphycus genes processed by PASA. And then, all these de novo gene predictions, homology based methods and RNA-seq data were combined into consensus gene structures using EVidenceModeler (EVM) and optimized by manual correction.

