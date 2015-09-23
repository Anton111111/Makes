#!/bin/bash

#version="$1"
version="3"
curPath=`pwd`
name="Mms_recovery"
path="${curPath}/${name}_v${version}"
templatePath="${curPath}/${name}_template"
pathP="/home/anton111111/android/cm12/out/target/product/generic/system/priv-app"
outPath="${curPath}/../"

rm -rf $path
rm -f "${curPath}/${name}_v${version}.zip"
cp -r $templatePath $path
cp -r $pathP/Mms $path/system/priv-app/Mms
cd $path && zip -r "${outPath}${name}_v${version}.zip" *

rm -rf $path