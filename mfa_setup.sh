#!/bin/bash
#script to set up the mfa conda environment


#load module
module reset; module load Anaconda3/2020.07

#set conda locations 
conda config --prepend envs_dirs $HOME/.conda/envs
conda config --prepend pkgs_dirs $HOME/.conda/pkgs

##initialize conda
#conda init bash
#
##source bashrc to get changes
#source ~/.bashrc

#(mimic) initialize conda
source conda_setup.sh

#create the aligner environment
conda create -n aligner -c conda-forge openblas python=3.8 openfst pynini ngram baumwelch pip

#activate the aligner environment
conda activate aligner

#install mfa inside the aligner environment
pip install montreal-forced-aligner

#load kaldi
module load tinkercliffs-rome/kaldi/20210429-foss-2020b

#tell mfa where kaldi is
mfa thirdparty kaldi $EBROOTKALDI
mfa thirdparty validate

