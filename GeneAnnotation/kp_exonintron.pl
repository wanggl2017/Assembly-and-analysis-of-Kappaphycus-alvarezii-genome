#! /usr/bin/perl 
use Bio::SearchIO;   

die "Usage:perl $0  <gff3> \n"if(@ARGV!=1);

open GFF,$ARGV[0];
open EXON,">kp.exon";
open TRANS,">kp.transcript";

#000013978       .       mRNA    34      3777    .       +       .       ID=evm.model.000013978.1;Parent=evm.TU.000013978.1
#000013978       .       exon    34      112     .       +       .       ID=evm.model.000013978.1.exon1;Parent=evm.model.000013978.1
#000013978       .       exon    1267    1416    .       +       .       ID=evm.model.000013978.1.exon2;Parent=evm.model.000013978.1
#000013978       .       CDS     1270    1416    .       +       0       ID=evm.model.000013978.1.cds2;Parent=evm.model.000013978.1
#000013978       .       exon    3116    3158    .       +       .       ID=evm.model.000013978.1.exon3;Parent=evm.model.000013978.1
#000013978       .       CDS     3116    3158    .       +       0       ID=evm.model.000013978.1.cds3;Parent=evm.model.000013978.1
#000013978       .       exon    3443    3777    .       +       .       ID=evm.model.000013978.1.exon4;Parent=evm.model.000013978.1
#000013978       .       CDS     3443    3576    .       +       2       ID=evm.model.000013978.1.cds4;Parent=evm.model.000013978.1
#$transcriptnum=0;
while(<GFF>)
{
	#000000673	EVM	mRNA	43811	44151	.	+	.	ID=evm.model.000000673.3;Parent=evm.TU.000000673.3
	if(/^\S+\s+\S+\s+mRNA\s+(\d+)\s+(\d+)\s+\S+\s+\S+\s+\S+\s+ID=(\S+);Parent=/)
	{
		$gene=$3;
		$i=1;
		$transcriptlen=$2-$1>0?$2-$1+1:$1-$2+1;
#		$transcriptnum++;
		print TRANS $gene,"\t",$transcriptlen,"\n";
#		print $1."\n";
	}
	#000000673	EVM	exon	43811	44151	.	+	.	ID=evm.model.000000673.3.exon1;Parent=evm.model.000000673.3
	if(/^\S+\s+\S+\s+exon\s+(\d+)\s+(\d+)\s+\S+\s+\S+\s+\S+\s+ID=\S+;Parent=(\S+)/)
	{
		print EXON $gene."-$i\t",$2-$1+1,"\n";
		$exonnum{$gene}++;
		$i++;
		$cdslen{$gene}+=($2-$1+1);
	}
}

open EXONNUN,">kp.exonnum";
foreach $key (keys %exonnum)
{
	print EXONNUN $key,"\t",$exonnum{$key},"\n";
}
open CDS,">kp.cds";
foreach $key1 (keys %cdslen)
{
	print CDS $key1,"\t",$cdslen{$key1},"\n";
}
