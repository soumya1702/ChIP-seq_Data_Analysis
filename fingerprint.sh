#!/bin/bash
#SBATCH -J fingerprint
#SBATCH -p general
#SBATCH -o fingerprint.txt
#SBATCH -A students
#SBATCH -e fingerprint.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

##### Load modules 
module load samtools
module load fastqc
module load trimgalore
module load bowtie/2.5.1
module load picard

##QC fingerprint
mkdir -p report/QC/${SAMPLE}/
plotFingerprint -b report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam -plot report/QC/${SAMPLE}/${SAMPLE}_fingerprint.png --ignoreDuplicates -l ${SAMPLE}
#CONTROL
mkdir -p report/QC/${CONTROL}/
plotFingerprint -b report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam -plot report/QC/${CONTROL}/${CONTROL}_fingerprint.png --ignoreDuplicates -l ${CONTROL}

