#!/bin/bash
#SBATCH -J peakcalling
#SBATCH -p general
#SBATCH -o peakcalling.txt
#SBATCH -A students
#SBATCH -e peakcalling.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --time=48:00:00
#SBATCH --mem=200G

pip install macs3 --user

#call narrowpeak - narrowPeak, automatically estimate fragmentsize
mkdir -p report/callpeak/${SAMPLE}/
macs3 callpeak -t report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam -c report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam -f BAM -g hs -q 0.01 -n ${SAMPLE}_MACS3 --outdir report/callpeak/${SAMPLE}

#call broadpeak - broadPeak, automatically estimate fragmentsize
macs3 callpeak -t report/alignment/${SAMPLE}/${SAMPLE}_MD_filtered.bam -c report/alignment/${CONTROL}/${CONTROL}_MD_filtered.bam -f BAM -g hs --broad -n ${SAMPLE}_MACS3_broad --outdir report/callpeak/${SAMPLE}
