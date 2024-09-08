#!/bin/bash
#SBATCH -J alignment
#SBATCH -p general
#SBATCH -o alignment.txt
#SBATCH -A students
#SBATCH -e alignment.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

##### Load modules 
module load samtools
module load bowtie/2.5.1

#alignment and sort
mkdir -p report/alignment/${SAMPLE}
bowtie2 --no-mixed -p 2 -x Index/genome -1 report/trimming/${SAMPLE}/${SAMPLE}_R1_L001_val_1.fq.gz -2 report/trimming/${SAMPLE}/${SAMPLE}_R2_L001_val_2.fq.gz | samtools view -Su /dev/stdin | samtools sort /dev/stdin -o report/alignment/${SAMPLE}/${SAMPLE}_sorted.bam

#CONTROL
mkdir -p report/alignment/${CONTROL}
bowtie2 --no-mixed -p 2 -x Index/genome -1 report/trimming/${CONTROL}/${CONTROL}_R1_L001_val_1.fq.gz -2 report/trimming/${CONTROL}/${CONTROL}_R2_L001_val_2.fq.gz | samtools view -Su /dev/stdin | samtools sort /dev/stdin -o report/alignment/${CONTROL}/${CONTROL}_sorted.bam

