#!/bin/bash

#mv corpus/* corpus_archive/

for src in corpus aligned; do
  #sourcedir="corpus"
  #archivedir="corpus_archive"
  sourcedir="$src"
  archivedir="${src}_archive"
  
  mkdir -p $archivedir
  
  if find "$sourcedir" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
    archivefls="$( ls $sourcedir/ )"
    mv $sourcedir/* $archivedir/
    if ! find "$sourcedir" -mindepth 1 -print -quit 2>/dev/null | grep -q .; then
      echo "archived: "$archivefls
    fi  
  else
    echo "nothing to archive ($sourcedir/ empty)"
  fi
done

