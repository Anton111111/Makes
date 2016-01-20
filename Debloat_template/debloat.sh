mount -o rw,remount /system

bkpPath=/sdcard1/temp/debloat_bkp

listForRemove=(
"/system/etc/product/applications/com.mobisystems.office"
"/system/etc/product/applications/com.sonymobile.xperialink"
"/system/etc/product/applications/facebook-xhdpi"
"/system/etc/product/applications/playstationapp"
"/system/etc/product/applications/smallbrowser"
"/system/app/Books"
"/system/app/Newsstand"
"/system/app/com.sonyericsson.xhs"
"/system/app/com.sonymobile.xperialounge.services"
"/system/app/YouTubeKaraokePlugin"
"/system/app/YouTubePlugin"
"/system/app/BasicDreams"
"/system/app/Galaxy4"
"/system/app/NoiseField"
"/system/app/SemcCalendar"
"/system/app/Gmail2"
"/system/priv-app/FBCalendarSync"
"/system/priv-app/helpapp"
"/system/priv-app/SemcEmail"
"/system/priv-app/SocialEngineCore"
"/system/priv-app/SocialEngineFacebookPlugin"
"/system/priv-app/SocialEnginePicasaPlugin"
"/system/priv-app/SOMCTwitterAccount"
"/system/priv-app/SemcNotes"
)


#if [ -d "$bkpPath" ]; then
#    echo "Backup folder ${bkpPath} is exists. Remove it and start script again."
#    exit 0;
#fi

if [ ! -d "$bkpPath" ]; then
    mkdir -p "$bkpPath"
fi


for item in "${listForRemove[@]}"
do
    itemParentPath=$(dirname "${item}")

    if [ -d "$item" ]; then
	if [ ! -d "${bkpPath}${itemParentPath}" ]; then
	    echo "make dir ${bkpPath}${itemParentPath}"
    	    mkdir -p "${bkpPath}${itemParentPath}"
	fi

	echo "move directory ${item}/ to ${bkpPath}${item}/"
	cp -fR "${item}" "${bkpPath}${item}"
	rm -rf ${item}
    fi


done

exit 0

