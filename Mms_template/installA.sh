CUR_NAME="$1"
WITH_ODEX="$2"

mount -o rw,remount /system

if [ -d /system/priv-app/$CUR_NAME ]; then
    rm -rf /system/priv-app/$CUR_NAME
fi


mkdir /system/priv-app/$CUR_NAME
mv /sdcard1/$CUR_NAME.apk /system/priv-app/$CUR_NAME/$CUR_NAME.apk
chmod 755 /system/priv-app/$CUR_NAME
chmod 644 /system/priv-app/$CUR_NAME/$CUR_NAME.apk

if [ "$WITH_ODEX" == "true" ]; then
    mkdir /system/priv-app/$CUR_NAME/arm
    mv /sdcard1/$CUR_NAME.odex /system/priv-app/$CUR_NAME/arm/$CUR_NAME.odex
    chmod 755 /system/priv-app/$CUR_NAME/arm
    chmod 644 /system/priv-app/$CUR_NAME/arm/$CUR_NAME.odex
fi





