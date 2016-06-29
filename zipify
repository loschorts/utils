# !/usr/bin/bash

# Run this script from a given directory to zip all 'Solution' and 'Skeleton'
# sub-directories automatically.

# Runs removes all .gitignored files before zipping

CURDIR=`pwd`
cd `git rev-parse --show-toplevel`
git clean -dfx
cd $CURDIR	

# Zips all 'skeleton' and 'solution' directories

find . -type d -name "solution" -print | while read f; do
  DIR_NAME=`dirname $f` 
  zip -r "$DIR_NAME/solution.zip" $f
done

find . -type d -name "skeleton" -print | while read f; do
    DIR_NAME=`dirname $f` 
    zip -r "$DIR_NAME/skeleton.zip" $f
done
