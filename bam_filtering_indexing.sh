#!/bin/bash
#SBATCH -J filtering
#SBATCH -p general
#SBATCH -o filtering.txt
#SBATCH -A students
#SBATCH -e filtering.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

module load picard
module load samtools

#filtering and indexing bam file
Apps/ngsutilsj bam-filter --mapped --no-qcfail --tag-min MAPQ:30 report/alignment/${SAMPLE}/${SAMPLE}_MD.bam report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam
samtools index report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam
#CONTROL
Apps/ngsutilsj bam-filter --mapped --no-qcfail --tag-min MAPQ:30 report/alignment/${CONTROL}/${CONTROL}_MD.bam report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam
samtools index report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam


