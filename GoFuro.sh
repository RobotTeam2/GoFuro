#!/bin/bash
date
rm -rf /dev/shm/Dropbox-Uploader/DOButtonGoFuro
WC=`pwd`
WC=/home/pi/GoFuro
if [ -d /dev/shm/Dropbox-Uploader ]
then
  echo "have been copied to ramdisk"
else
  cp -rf ${WC}/Dropbox-Uploader /dev/shm/
fi


echo "try download trigger text file from drop box..."
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh download DOButtonGoFuro

if [ -f /dev/shm/Dropbox-Uploader/DOButtonGoFuro/GoFuro.txt ] 
then
  ${WC}/sendBTCommand.sh
else
  if [ -f /dev/shm/Dropbox-Uploader/DOButtonGoFuro/gofuro.txt ] 
  then
    ${WC}/sendBTCommand.sh
  else
    echo "!!!no trigger of gofuro!!!"
  fi
fi




echo "try to delete old files on drop box..."
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh delete DOButtonGoFuro

echo "try to upload run log"
cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh upload /dev/shm/GoFuro.log goFuroLog/GoFuro.log.txt


actualsize=0
if [ -f /dev/shm/GoFuro.log ] 
then
  actualsize=`wc -c < /dev/shm/GoFuro.log`
fi
echo "actualsize = $actualsize"
# max log 10K
minimumsize=100000
echo "minimumsize = $minimumsize"
if [ $actualsize -ge $minimumsize ]
then
  rm -f /dev/shm/GoFuro.log
fi
sync
