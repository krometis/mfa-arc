#!/bin/bash

#SBATCH -N 1 --tasks-per-node=4
#SBATCH -t 24:00:00
#SBATCH -p normal_q
#SBATCH -A katcarm_lab
##SBATCH --mail-user=katcarm@vt.edu
#SBATCH --mail-type=END

#load modules
module reset
module load Anaconda3/2020.07
module load tinkercliffs-rome/kaldi/20210429-foss-2020b

export OPENBLAS_NUM_THREADS=$SLURM_NTASKS

#(mimic) initialize conda
source conda_setup.sh

#activate the mfa environment
conda activate aligner

logfile=$( pwd )/mfa_validate.log
> $logfile

corpus="corpus"
dict="dict/librispeech-lexicon.txt"

echo "LOG: $( date ): Start mfa validate"   | tee -a $logfile

#run validate
mfa validate $corpus $dict english          | tee -a $logfile

#collect the oovs into the validate directory
mkdir -p validate
cp $HOME/Documents/MFA/$corpus/corpus_data/*oov*.txt validate/

echo "LOG: $( date ): End mfa validate"     | tee -a $logfile

#deactivate mfa environment
conda deactivate
