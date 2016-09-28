#!/bin/bash

cluerc=~/.cluerc

if [ ! -r $cluerc ]; then
  echo "No ~/.cluerc found."
  exit 1
fi

source $cluerc

if [ -z ${cluepath+x} ]; then
  echo "No cluepath set in $cluerc."
  echo "~/.clues is commonly used."
	exit 1
fi

if [ -z ${cluesep+x} ]; then
  echo "No cluesep set in $cluerc."
	exit 1
fi

cluedir=/tmp/clues/

rm --recursive --force $cluedir
mkdir $cluedir
csplit $cluepath --prefix=$cluedir /$cluesep/ {*} --quiet --suppress-matched

sed -i -e :a -e '/./,$!d;/^\n*$/{$d;N;};/\n$/ba' /tmp/clues/*

echo ""
grep --recursive --no-filename "$cluedir" -e "$1" -C 1000 --color \
  --group-separator="---------------------------------------------------------------------------------"
echo ""
