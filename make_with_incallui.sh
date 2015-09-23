#!/bin/bash

#version="$1"
version="6"
curPath=`pwd`
name="Dialer_With_InCallUI"
path="${curPath}/${name}_v${version}"
templatePath="${curPath}/${name}_template"
pathP="/home/anton111111/android/cm12/out/target/product/generic/system/priv-app"
outPath="${curPath}/../"

rm -rf $path
cp -r $templatePath $path
cp -r $pathP/Dialer $path/Dialer
cp -r $pathP/Contacts $path/Contacts
cd $path && cd "./.."
zip -r "${outPath}${name}_v${version}.zip" "./${name}_v${version}"
cd $curPath
rm -rf $path