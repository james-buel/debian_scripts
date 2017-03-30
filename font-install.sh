#!/bin/bash

########################################################################
#
# Font installer script for Debian 
# 
# Date: 2007-03-29
# Author: James Buel (jamesbuel.com)
# Contact: james.buel@gmail.com
# Repository: github.com/james-buel
#
########################################################################
# 
# Usage: ./font-install.sh [URL]
# Example: $: ./font-install.sh https://website.com/fonts/fontname.ttf
#
########################################################################

URL=$1
FILENAME=${URL##*/}
FONT_DIR=/usr/share/fonts/truetype/custom/
TMP_DIR=font_$USER\_$(date +%s)

echo $FILENAME
echo $FONT_DIR


echo "[ Installing $FILENAME to $FONT_DIR ]"
sudo mkdir -p /tmp/$TMP_DIR
sudo mkdir -p $FONT_DIR
sudo cd /tmp/$TMP_DIR

echo "[ Downloading... ]"
sudo wget -c $URL
sleep 2

echo "[ Installing... ]"
sudo mv -v $FILENAME $FONT_DIR
sleep 2

echo "[ Updating font cache... ]"
sudo fc-cache -f -v
sleep 2

echo "[ Cleaning up... ]"
sudo rm -rf /tmp/$TMP_DIR
sleep 2
echo "[ DONE ]"
