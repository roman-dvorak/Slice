#!/bin/sh -l
echo "Spoustim s nastavenim" $1

cd /github/workspace

FILES=$(git diff --name-only HEAD~1 | sort -u | grep '.stl\|.amf\|.STL\|.AMF');

CFG='slice.yml';
WHITEPATH=$(cat slice.yml | shyaml get-values path);

for file in $FILES; do
  CONFIG=$(cat slice.yml | shyaml get-value default.config);
  PRINTER=$(dirname $(cat slice.yml | shyaml get-value default.config))"/printer."$1".ini";
  
  echo "Changed sliceable file:" $file;
  # otestovat, jestli soubor je na whitelistu? 
  echo "spojit soubory" $CONFIG $PRINTER "pro" $file
  echo "vyslicovat spojeny"
  
  
done
