#!/bin/bash

#version="$1"
version="6"
curPath=`pwd`
name="Debloat_recovery"
path="${curPath}/${name}_v${version}"
templatePath="${curPath}/${name}_template"
outPath="${curPath}/../"

rm -rf $path
rm -f "${curPath}/${name}_v${version}.zip"
cp -r $templatePath $path
cd $path && zip -r "${outPath}/${name}_v${version}.zip" *
rm -rf $path