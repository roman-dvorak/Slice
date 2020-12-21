#!/bin/sh -l
echo "Spoustim s nastavenim" $1

cd /github/workspace
ROOT=/github/workspace

mkdir out
mkdir out/gcode
mkdir out/ini

#FILES=$(git diff --name-only HEAD~1 | sort -u | grep '.stl\|.amf\|.STL\|.AMF');
#FILES="/hw/CAD/stl/RPM_case.stl";
FILES=$(find hw | sort -u | grep '.stl\|.amf\|.STL\|.AMF')

CFG='slice.yml';
WHITEPATH=$(cat slice.yml | shyaml get-values path);

for file in $FILES; do
  CONFIG=$(cat slice.yml | shyaml get-value default.config);
  PRINTER=$(dirname $(cat slice.yml | shyaml get-value default.config))"/printer."$1".ini";
  OUT=/out/ini/$(basename $file).ini
  
  echo "Changed sliceable file:" $file;
  # otestovat, jestli soubor je na whitelistu? 
  echo "spojit soubory" $ROOT$CONFIG $ROOT$PRINTER "pro" $ROOT$out
  /home/merge_slic3r_conf.sh -m $ROOT$CONFIG -p $ROOT$PRINTER -o $ROOT$out
  echo "konfigurace spojeny"
  echo "gcode:" out/gcode/$(base $file).gcode;
  echo "ini" out/ini/$(base $file).ini;
  #echo "" > out/gcode/$file.gcode
  #echo "" > out/ini/$file.ini
  
done
