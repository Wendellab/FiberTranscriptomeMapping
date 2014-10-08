#!usr/bin/bash

#find all file names
#shopt -s nullglob
echo "starting"
arr_Dirnames=( `ls -d */` )
for i in "${arr_Dirnames[@]}" ; do
   echo "Starting analysis.."
   echo "In directory: $i"
   cd  $i
   echo ""
   arr_Filenames=`ls | grep .fastq$`
   for j in  "${arr_Filenames[@]}";	do

   		echo "Running Sickle for"
		echo $j
		echo ""
		sickle se -f $j -t sanger -o $j.trimmed.fastq
		
		echo "Running GSNAP for"
		echo $j.trimmed.fastq
		echo ""
		#index 4.0 for diploids, and 4.1 for AD1

		gsnap -n 1 -N 1 -Q -t 8 --use-sarray=0 -D /data/databases/gmapdb/snpindex4.0 -d D5genome -v D13.snp4.0 -A sam $j.trimmed.fastq > $j.trimmed.sam 

		echo "Running SAMtools for" 
		echo $j.trimmed.sam
		echo ""
		samtools view -Sb $j.trimmed.sam > $j.trimmed.bam
		samtools sort $j.trimmed.bam $j.trimmed_align
		samtools index $j.trimmed_align.bam
		
		echo $j.trimmed.fastq
		echo $j.trimmed.sam
		echo $j.trimmed.bam
		rm $j.trimmed.fastq
		rm $j.trimmed.sam
		rm $j.trimmed.bam
		cd ..
   	done
done
