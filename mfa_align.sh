#!/bin/bash

#SBATCH -N 1 --tasks-per-node=8 #8 because we sometimes need more memory
#SBATCH -t 24:00:00
#SBATCH -p largemem_q #normal_q
#SBATCH -A katcarm_lab
##SBATCH --mail-user=katcarm@vt.edu
#SBATCH --mail-type=END

#load modules
module reset
module load Anaconda3/2020.07
module load tinkercliffs-rome/kaldi/20210429-foss-2020b

#give two cores' worth of memory per job
export njobs=$(( $SLURM_NTASKS/2 ))
#i don't know if this does anything but seems like it doesn't hurt to try
export OPENBLAS_NUM_THREADS=2
export OMP_NUM_THREADS=2

#(mimic) initialize conda -- don't do, use source below
# source conda_setup.sh

#activate the mfa environment
#conda activate aligner
source activate aligner

logfile=$( pwd )/mfa_align.log
> $logfile

corpus="corpus"
dict="dict/librispeech-lexicon.txt"
config="config_long.yml"

echo "LOG: $( date ): Start mfa align"                           | tee -a $logfile

#run the alignment
mfa align --config_path=$config --clean --num_jobs $njobs $corpus $dict english aligned | tee -a $logfile

#print some useful information at the end
echo "Contents of corpus/align/log/align.final.0.log:"           | tee -a $logfile
echo "-----------------------------------------------"           | tee -a $logfile
cat $HOME/Documents/MFA/$corpus/align/log/align.final.0.log      | tee -a $logfile
echo "-----------------------------------------------"           | tee -a $logfile
if [ -f aligned/unaligned.txt ]; then 
  echo "Unaligned files:"                                        | tee -a $logfile
  cat aligned/unaligned.txt                                      | tee -a $logfile
else
  echo "File aligned/unaligned.txt does not exist."              | tee -a $logfile
  echo "All files appear to have aligned successfully."          | tee -a $logfile
fi

echo "LOG: $( date ): End mfa align"                             | tee -a $logfile

#deactivate mfa environment
conda deactivate
