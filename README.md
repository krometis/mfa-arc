# mfa-arc
Scripts and directory structure to run the [Montreal Forced Aligner](http://montreal-forced-aligner.readthedocs.io) on HPC infrastructure at Virginia Tech (https://www.arc.vt.edu)

Download these files:
```
git clone git@github.com:krometis/mfa-arc.git
cd mfa-arc
```
One-time setup to create the conda environment, install MFA, and tie in with Kaldi:
```
source mfa_setup.sh
```
Copy your corpus into `corpus/` and then submit a job to run alignment:
```
sbatch mfa_align.sh
```
