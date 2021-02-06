#!/bin/sh -l
##
## printer
## folders - list of folders where to search
## model default ini


echo "PARAMETRY>" $@
echo "Spoustim s nastavenim" $1

env

cd /github/workspace
ROOT=/github/workspace

mkdir out
mkdir out/stl
mkdir out/amf

#FILES=$(git diff --name-only HEAD~1 | sort -u | grep '.scad\|.SCAD');
#FILES="/hw/CAD/stl/RPM_case.stl";
FILES=$(find . | sort -u | grep '\.SCAD\|\.scad')

echo "Soubory:" $FILES
#CFG='slice.yml';
#WHITEPATH=$(cat render.yml | shyaml get-values path);

for file in $FILES; do
#   CONFIG=$(cat slice.yml | shyaml get-value default.config);
#   PRINTER=$(dirname $(cat slice.yml | shyaml get-value default.config))"/printer."$1".ini";
#   INI_OUT=$ROOT/out/ini/$(basename ${file%.*}).ini
STL_OUT=$ROOT/out/stl/$(basename ${file%.*}).stl
  
  echo "Changed render:" $file
  
  # zjistit, jestli STL je na whitelistu
#   if echo $file| grep -zw "/hw" > /dev/null; then 
#     echo "Ano, muzu slicovat";
#   else
#     echo "Preskakuji";
#     break;
#   fi


  openscad -o $STL_OUT -D week=$(date +%V) $file
  echo "render done"
  # Zakladni .ini
#   MERGE_PARAM="-p "$ROOT$CONFIG
#   ## Existuje konfigurace pro tiskornu??
#   if [ -f "$ROOT$$PRINTER" ]; then
#     MERGE_PARAM=$MERGE_PARAM" -p "$ROOT$PRINTER
#   fi
#   MERGE_PARAM=$MERGE_PARAM" -o "$INI_OUT

#   echo "spojit soubory"
#   /home/merge_slic3r_conf.sh $MERGE_PARAM
#   echo "konfigurace spojeny"

#   echo "gcode:" $GCODE_OUT;
#   slic3r --no-gui --load $INI_OUT --output $GCODE_OUT $file
#   #echo "" > out/gcode/$file.gcode
  #echo "" > out/ini/$file.ini
   
done
