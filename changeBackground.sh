#!/usr/bin/env bash

filePicture="$(zenity --file-selection --directory --filename="/root/Pictures/")"
if [[ $? -ne 0 ]];then
    zenity --info --no-wrap --text="Your Program has been terminated"
    exit 0
fi
ls "$filePicture" > ListBackground.txt
while read LINE; do
    backgroundArray+=("$LINE")
done < ListBackground.txt


listNum=${#backgroundArray[@]}

pathFile="file://"${filePicture}"/"


while true ; do
    pos=$((RANDOM % $listNum))
    #echo $pos
    pathPicture=${pathFile}${backgroundArray[$pos]}
    gsettings set org.gnome.desktop.background picture-uri "$pathPicture"
    sleep 5
done
