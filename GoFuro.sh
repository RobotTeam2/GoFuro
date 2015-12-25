#!/bin/bash
date
rm -rf /dev/shm/GoFuro/Dropbox-Uploader/DOButtonGoFuro
cd /dev/shm/GoFuro/Dropbox-Uploader/ && ./dropbox_uploader.sh download DOButtonGoFuro

if [ -f /dev/shm/GoFuro/Dropbox-Uploader/DOButtonGoFuro/gofuro.txt ] 
then
  /home/pi/GoFuro/sendBTCommand.sh
else
  echo "!!!no trigger of gofuro!!!"
fi




cd /dev/shm/GoFuro/Dropbox-Uploader/ && ./dropbox_uploader.sh delete DOButtonGoFuro
sync


