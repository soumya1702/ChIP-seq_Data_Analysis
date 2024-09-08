#!/bin/bash
#SBATCH -J quality
#SBATCH -p general
#SBATCH -o quality.txt
#SBATCH -A students
#SBATCH -e quality.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

##### Load modules 
module load samtools
module load fastqc
module load trimgalore


mkdir -p /N/scratch/syennapu/ChIPseq
cd /N/scratch/syennapu/ChIPseq

#FASTQC
mkdir -p report/fastqc/
fastqc Data/*.fastq.gz -o report/fastqc/

#adapter trimming and fastqc
mkdir -p report/trimming/${SAMPLE}
trim_galore --paired --fastqc Data/${SAMPLE}_R1_L001.fastq.gz Data/${SAMPLE}_R2_L001.fastq.gz -o report/trimming/${SAMPLE}/
#CONTROL
mkdir -p report/trimming/${CONTROL}
trim_galore --paired --fastqc Data/${CONTROL}_R1_L001.fastq.gz Data/${CONTROL}_R2_L001.fastq.gz -o report/trimming/${CONTROL}/

