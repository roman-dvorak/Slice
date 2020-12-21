#!/bin/sh -l
##
## printer
## folders - list of folders where to search
## model default ini


echo "PARAMETRY>" $@
echo "Spoustim s nastavenim" $1

cd /github/workspace
ROOT=/github/workspace

mkdir out
mkdir out/gcode
mkdir out/ini

#FILES=$(git diff --name-only HEAD~1 | sort -u | grep '.stl\|.amf\|.STL\|.AMF');
#FILES="/hw/CAD/stl/RPM_case.stl";
FILES=$(find hw | sort -u | grep '\.stl\|\.amf\|\.STL\|\.AMF')

CFG='slice.yml';
WHITEPATH=$(cat slice.yml | shyaml get-values path);

for file in $FILES; do
  CONFIG=$(cat slice.yml | shyaml get-value default.config);
  PRINTER=$(dirname $(cat slice.yml | shyaml get-value default.config))"/printer."$1".ini";
  INI_OUT=$ROOT/out/ini/$(basename ${file%.*}).ini
  GCODE_OUT=$ROOT/out/gcode/$(basename ${file%.*}).gcode
  
  echo "Changed sliceable file:" $file
  
  # zjistit, jestli STL je na whitelistu
  if echo $P| grep -zw "/hw" > /dev/null; then 
    echo "Ano, muzu slicovat";
  else
    echo "Preskakuji";
    break;
  fi
  
  # Zakladni .ini
  MERGE_PARAM="-p $ROOT$CONFIG"
  ## Existuje konfigurace pro tiskornu??
  if [ -f "$ROOT$$PRINTER" ]; then
    MERGE_PARAM=$MERGE_PARAM+" -p $ROOT$PRINTER"
  fi
  MERGE_PARAM=$MERGE_PARAM+" -o $INI_OUT"
  
  echo "spojit soubory" $MERGE_PARAM
  /home/merge_slic3r_conf.sh $MERGE_PARAM
  echo "konfigurace spojeny"
  
  #echo "gcode:" $GCODE_OUT;
  #slic3r --no-gui --load $INI_OUT --output $GCODE_OUT $file
  #echo "" > out/gcode/$file.gcode
  #echo "" > out/ini/$file.ini
  
done
