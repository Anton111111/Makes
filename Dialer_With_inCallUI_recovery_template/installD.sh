#!/sbin/sh

if [ -f /system/priv-app/InCallUI/InCallUI.apk ]; then
    mv -f /system/priv-app/InCallUI/InCallUI.apk /system/priv-app/InCallUI/InCallUI.apk.bak
fi

exit 0

