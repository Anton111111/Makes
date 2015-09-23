#!/bin/bash

#version="$1"
version="6"
curPath=`pwd`
name="Dialer_With_inCallUI_recovery"
path="${curPath}/${name}_v${version}"
templatePath="${curPath}/${name}_template"
pathP="/home/anton111111/android/cm12/out/target/product/generic/system/priv-app"
outPath="${curPath}/../"

rm -rf $path
rm -f "${curPath}/${name}_v${version}.zip"
cp -r $templatePath $path
cp -r $pathP/Dialer $path/system/priv-app/Dialer
cp -r $pathP/Contacts $path/system/priv-app/Contacts
cd $path && zip -r "${outPath}/${name}_v${version}.zip" *
rm -rf $path