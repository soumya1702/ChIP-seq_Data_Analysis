#!/bin/bash
#SBATCH -J fragment_estimate
#SBATCH -p general
#SBATCH -o fragment_estimate.txt
#SBATCH -A students
#SBATCH -e fragment_estimate.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

##### Load modules 
module load samtools
module load fastqc
module load bowtie/2.5.1
#module load picard

##QC estimate fragment size
bamPEFragmentSize --bamfiles  report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam -hist report/QC/${SAMPLE}/${SAMPLE}_fragment.png --samplesLabel ${SAMPLE}
#CONTROL
bamPEFragmentSize --bamfiles  report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam -hist report/QC/${CONTROL}/${CONTROL}_fragment.png --samplesLabel ${CONTROL}

