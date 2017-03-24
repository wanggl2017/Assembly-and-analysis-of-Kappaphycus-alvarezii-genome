#!/bin/bash

#Blast to databases
/path/to/blastall -p blastp -d /path/to/database.fasta -i proteins.aa -o /path/to/output.txt -e 1e-5 -F F 

#InterproScan
java -Xmx2000m -jar server-5.17-56.0-jetty-console.war --headless &
interproscan.sh -appl Pfam -goterms -pa -iprlookup -t p -i protein.aa -d .
