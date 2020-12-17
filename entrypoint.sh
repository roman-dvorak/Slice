#!/bin/sh -l

tree /github

cd /github/workspace

git rev-parse HEAD;
git status;
git diff --name-only HEAD^;

git log;
FILES=$(git diff --name-only HEAD~1 | sort -u | grep '.stl\|.amf\|.STL\|.AMF');

for file in $FILES; do
  echo "Changed sliceable file:" $FILES;
  
done
