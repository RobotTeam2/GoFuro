#!/bin/bash
date
rm -rf /dev/shm/Dropbox-Uploader/DOButtonGoFuro
if [ -d /dev/shm/Dropbox-Uploader ]
then
  echo "have been checkout form github do noting"
else
  cp -rf /home/pi/GoFuro/Dropbox-Uploader /dev/shm/
fi


cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh download DOButtonGoFuro

if [ -f /dev/shm/Dropbox-Uploader/DOButtonGoFuro/gofuro.txt ] 
then
  /home/pi/GoFuro/sendBTCommand.sh
else
  echo "!!!no trigger of gofuro!!!"
fi




cd /dev/shm/Dropbox-Uploader/ && ./dropbox_uploader.sh delete DOButtonGoFuro
sync


