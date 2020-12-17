#!/bin/sh -l

tree /github

cd /github/workspace

FILES=$(git diff --name-only HEAD~1; | sort -u | grep '.stl\|.amf\|.STL\|.AMF');

for file in $FILES; do
  echo "Changed sliceable file:" $FILES;
  
done
