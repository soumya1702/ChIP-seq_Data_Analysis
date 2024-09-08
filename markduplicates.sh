#!/bin/bash
#SBATCH -J markduplicates
#SBATCH -p general
#SBATCH -o markduplicates.txt
#SBATCH -A students
#SBATCH -e markduplicates.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

##Download ngsutilsj
mkdir -p Apps
wget https://github.com/compgen-io/ngsutilsj/releases/download/ngsutilsj-0.5.0/ngsutilsj -P Apps
chmod +x Apps/ngsutilsj
wget https://github.com/broadinstitute/picard/releases/download/2.27.5/picard.jar -P Apps
picard=/N/scratch/$USER/ChIPseq/Apps/picard.jar

#mark duplicates
java -jar $picard MarkDuplicates --INPUT report/alignment/${SAMPLE}/${SAMPLE}_sorted.bam --OUTPUT report/alignment/${SAMPLE}/${SAMPLE}_MD.bam --METRICS_FILE report/alignment/${SAMPLE}/${SAMPLE}_PCRDupes.txt
#CONTROL
java -jar $picard MarkDuplicates --INPUT report/alignment/${CONTROL}/${CONTROL}_sorted.bam --OUTPUT report/alignment/${CONTROL}/${CONTROL}_MD.bam --METRICS_FILE report/alignment/${CONTROL}/${CONTROL}_PCRDupes.txt

