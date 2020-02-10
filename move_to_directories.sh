#!/bin/bash
#move all wav files in corpus into subdirectories with the
#same name, and create corresponding folders in aligned

corpus="corpus_justin"
aligned="aligned"

echo "working with corpus=$corpus and aligned=$aligned"
for wavfl in $( ls $corpus/*.wav ); do
  fl=$( basename $wavfl | sed 's/\.wav//' )
  mkdir $corpus/$fl
  mkdir $aligned/$fl
  mv $corpus/$fl.* $corpus/$fl/
  echo "moved $fl"
done
