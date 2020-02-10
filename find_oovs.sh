#!/bin/bash

#oovfl="$HOME/Documents/MFA/corpus/corpus_data/oovs_found.txt"
oovfl="validate/oovs_found.txt"
corpus="corpus"
outfile="validate/oov_location.txt"

> $outfile
oovs="$( cat $oovfl )"

for oov in $oovs; do
  echo "$oov:" | tee -a $outfile
  grep -i -l $oov $corpus/*.txt | sed 's/^/  /' | tee -a $outfile
done
