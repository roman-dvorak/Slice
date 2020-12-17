#!/bin/sh -l

args=("$@") 
ELEMENTS=${#args[@]} 
 
for (( i=0;i<$ELEMENTS;i++)); do 
    echo ${args[${i}]} 
done
