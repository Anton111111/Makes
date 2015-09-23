#!/bin/bash

pathP=.

WITH_ODEX="false"

for CUR_NAME in "$@"
do
    if [ -f $pathP/$CUR_NAME/$CUR_NAME.apk ] && ([ "$WITH_ODEX" != "true" ] || [ -f $pathP/$CUR_NAME/arm/$CUR_NAME.odex ]); then
        adb push $pathP/$CUR_NAME/$CUR_NAME.apk /sdcard1/$CUR_NAME.apk &&
        if [ "$WITH_ODEX" == "true" ]; then
            adb push $pathP/$CUR_NAME/arm/$CUR_NAME.odex /sdcard1/$CUR_NAME.odex  || { exit 1; }
        fi
        adb push ./installA.sh /sdcard1/installA.sh &&
        adb shell su -c "chmod 644 /sdcard1/$CUR_NAME.apk" &&
        if [ "$WITH_ODEX" == "true" ]; then
            adb shell su -c "chmod 644 /sdcard1/$CUR_NAME.odex" || { exit 1; }
        fi
        adb shell su -c "chmod 755 /sdcard1/installA.sh" &&
        adb shell su -c "sh /sdcard1/installA.sh $CUR_NAME"
        adb shell su -c "rm -f /sdcard1/installA.sh"
fi
done


