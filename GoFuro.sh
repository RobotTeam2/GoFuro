#!/bin/bash
date
rm -rf /home/pi/GoFuro/Dropbox-Uploader/DOButtonGoFuro
cd /home/pi/GoFuro/Dropbox-Uploader/ && ./dropbox_uploader.sh download DOButtonGoFuro

if [ -f /home/pi/GoFuro/Dropbox-Uploader/DOButtonGoFuro/gofuro.txt ] 
then
  /home/pi/GoFuro/sendBTCommand.sh
else
  echo "!!!no trigger of gofuro!!!"
fi




cd /home/pi/GoFuro/Dropbox-Uploader/ && ./dropbox_uploader.sh delete DOButtonGoFuro
sync


