#!/bin/bash

#version="$1"
curPath=`pwd`
version="3"
name="Mms"
path="${curPath}/${name}_v${version}"
templatePath="${curPath}/${name}_template"
pathP="/home/anton111111/android/cm12/out/target/product/generic/system/priv-app"
outPath="${curPath}/../"

rm -rf $path
cp -r $templatePath $path
cp -r $pathP/Mms $path/Mms
cd $path && cd "./.."
zip -r "${outPath}${name}_v${version}.zip" "./${name}_v${version}"
cd $curPath
rm -rf $path