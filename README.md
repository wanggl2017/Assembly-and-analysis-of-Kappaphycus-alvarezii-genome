# Assembly-and-analysis-of-Kappaphycus-alvarezii-genome


Workflow

Data accession
All of the raw reads has been deposited at SRA under the accession SRP101845. This Whole Genome Shotgun project has been deposited at DDBJ/ENA/GenBank under the accession NADL00000000. The version described in this paper is version NADL01000000. The raw sequence data has also been deposited in the Genome Sequence Archive in BIG Data Center , Beijing Institute of Genomics (BIG), Chinese Academy of Sciences, under accession numbers PRJCA000373 that are publicly accessible at http://bigd.big.ac.cn/gsa. 

Estimation of the genome size and hybrid de novo genome assembly
Genome sizes were estimated by the k-mer-based method in Jellyfish program. K-mer analysis was performed by using 34.15 Gb clean sequences from 300 and 500 bp insert size libraries
  De novo genome assembly of uncorrected PacBio reads was performed using Canu [9] with the default parameters to yield the primary assembly. The contig graph from canu.gfa file of primary assembly was used to check relatedness of contig connections and to improve the assembly. 
  
Evaluation of the completeness of the genome assembly
To evaluate the completeness of the assembly, a set of ultra-conserved core eukaryotic genes identified by CEGMA were mapped to the assembled genome using CEGMA and a new tool BUSCO, which quantitatively assess genome completeness using evolutionarily informed expectations of gene content.

