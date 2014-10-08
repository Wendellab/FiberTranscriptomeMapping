FiberTranscriptomeMapping
=========================

a shell script that can be used to re-create all the mapping data for the FiberTranscriptome Project. The orignal bam files have been removed in order to save space. The script loopTemplate.sh will re-mapp the reads based on AD1 and A1 raw fastq files being placed in their own seperate directory. A subdirtory structure is allowed if you like. 

The scrip will trim raw fastq files, map them with gsnap to the D5 reference genome, and sort and index with bamtools.

The raw files are backed up on Isilion and the appropriate sample information is found in the file "Wendel_Lab_Sample_Information_042014v2.xlsx" in the /data/Projects/FiberTranscriptomeProject directory.  
