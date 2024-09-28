#!/bin/bash

echo $1

pwd 

echo copy values to dir base 
cp ./values.yaml  ./base

echo export manifest
helm template myrelease ./base --output-dir ./base_$1 --dry-run 
rm -fr base/values.yaml

ls -l | grep base_$1

echo  move manifest to Dir base_$1

mv ./base_$1/base/templates/* ./base_$1
rm -fr ./base_$1/base/

echo Successful !!!