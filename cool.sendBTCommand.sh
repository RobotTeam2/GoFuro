#!/bin/bash
echo $0 " GoFuro cold cold to  /dev/rfcomm10"
option=`date`
echo "GoFuro cold cold ----- $option" > /dev/rfcomm10
