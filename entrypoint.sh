#!/bin/sh -l

echo "promenne"
echo $(compgen -v | grep GIT)

#cd /github/worspace

FILES=$(git diff --name-only 467d60e67e44c2b6d691b033a186ecf6be12c592..eba99396edec2e2aa42fa25a36aee5d81fd3b0f7 | sort -u | grep '.stl\|.amf\|.STL\|.AMF')

for file in $FILES; do
  echo "Changed sliceable file:" $FILES;
  
done
