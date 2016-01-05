#!/bin/bash
date
rm -rf /dev/shm/Dropbox-Uploader/DOButtonGoFuro
if [ -d /dev/shm/Dropbox-Uploader ]
then
  echo "have been copied to ramdisk"
else
  cp -rf /home/pi/GoFuro/Dropbox-Uploader /dev/shm/
fi


echo "try download trigger text file from drop box..."
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh download DOButtonGoFuro

if [ -f /dev/shm/Dropbox-Uploader/DOButtonGoFuro/gofuro.txt ] 
then
  /home/pi/GoFuro/sendBTCommand.sh
else
  echo "!!!no trigger of gofuro!!!"
fi



echo "try to delete old files on drop box..."
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh delete DOButtonGoFuro
echo "try to upload run log"
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh upload /dev/shm/GoFuro.log GoFuro.log.txt


actualsize=`wc -c < /dev/shm/GoFuro.log`
echo "actualsize = $actualsize"
minimumsize=1000000
echo "minimumsize = $minimumsize"
if [ $actualsize -ge $minimumsize ]
then
  rm -f /dev/shm/GoFuro.log
fi
sync


