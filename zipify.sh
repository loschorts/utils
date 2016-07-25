# !/usr/bin/bash

# Run this script from a given directory to zip all 'Solution' and 'Skeleton'
# sub-directories automatically.

# Removes all .gitignored files before zipping

if [[ $(git status --porcelain) ]]; then 
	echo 'Warning: unstaged changes. Stash or add your changes before zipifying.'
	exit
fi

CURDIR=`pwd`
# cd `git rev-parse --show-toplevel`
# git clean -dfx
# cd $CURDIR	

# Zips all 'skeleton' and 'solution' directories

find . -type d -name "solution" -print | while read f; do
	cd $CURDIR
  DIR_NAME=`dirname $f` 
  cd $DIR_NAME
  rm solution.zip
  zip -r "solution.zip" solution
done


find . -type d -name "skeleton" -print | while read f; do
  cd $CURDIR
  DIR_NAME=`dirname $f` 
  cd $DIR_NAME
  rm skeleton.zip
  zip -r "skeleton.zip" skeleton
done

cd $CURDIR

