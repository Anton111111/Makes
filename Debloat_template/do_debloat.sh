#!/bin/bash

adb push ./debloat.sh /sdcard1/debloat.sh &&
adb shell su -c "chmod 755 /sdcard1/debloat.sh" &&
adb shell su -c "sh /sdcard1/debloat.sh"
adb shell su -c "rm -f /sdcard1/debloat.sh"

