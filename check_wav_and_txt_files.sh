#!/bin/bash
#check:
# 1) encoding of txt files (should be ascii)
# 2) sampling rate of wav files (should all match)
#

corpus="corpus" #directory to look in

#if corpus contains txt files, check their encoding
txtfiles=$( find $corpus -name '*.txt' -type f )
if [ -n "$txtfiles" ]; then 
  echo "txt file encoding is:"
  file -i $txtfiles
fi

#if corpus contains wav files, check their sampling rates
wavfiles=$( find $corpus -name '*.wav' -type f )
if [ -n "$wavfiles" ]; then 
  echo "wav file sampling rates are: (these should all match)"
  #loop across files and print the sample rate for each
  for fl in $( ls $corpus/*.wav ); do 
    echo "$(soxi $fl | grep '^Sample Rate') ($fl)"; 
  done
fi

