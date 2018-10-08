#!/bin/bash
for entry in images/*
do
  if [ -f "$entry" ];then
    sleep 1;
    echo "$entry";
    alpr $entry --clock -n 1;
#    $PYTHON $SCRIPT_PATH $entry;
  fi
echo "Processing successful";
done
