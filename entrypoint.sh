#!/bin/sh -l

tree /github

cd /github/workspace

git status
git log
FILES=$(git diff --name-only HEAD~1..HEAD | sort -u | grep '.stl\|.amf\|.STL\|.AMF')

for file in $FILES; do
  echo "Changed sliceable file:" $FILES;
  
done
