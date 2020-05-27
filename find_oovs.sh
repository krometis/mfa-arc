#!/bin/bash
#script to 
# 1) copy files from mfa's oov location to a more permanent location
# 2) identify the locations of oovs in the corpus

corpus="corpus"
mfadir="$HOME/Documents/MFA/$corpus/corpus_data"
finaldir="validate"
oovfl="oovs_found.txt"
outfile="oov_location.txt"


#copy files from mfadir to finaldir
echo "copying oov files from $mfadir to $finaldir"
cp $mfadir/*oov*.txt $finaldir/
echo "oov files are:"
ls -lh $finaldir/*oov*.txt | grep -v $outfile


#find the locations of each oov in the corpus
echo "finding oov locations in the corpus $corpus"
> $finaldir/$outfile
oovs="$( cat $finaldir/$oovfl )"

for oov in $oovs; do
  echo "$oov:" | tee -a $finaldir/$outfile
  #grep -i -l $oov $corpus/*.{txt,TextGrid} | sed 's/^/  /' | tee -a $finaldir/$outfile
  grep -i -l $oov $corpus/*.txt | sed 's/^/  /' | tee -a $finaldir/$outfile
done

