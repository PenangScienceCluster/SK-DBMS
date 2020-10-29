#!/bin/bash
set -e

# Set downloader
DLDR=`which wget && echo -ne '-O -' || true`
[[ -z ${DLDR} ]] && DLDR=`which curl && echo -ne '-fSL' || true`
[[ -z ${DLDR} ]] && echo "Please install either wget or curl and run this script again." && exit 1

echo "Installer starts..."
# Installer download link
DLLINK_VSC="https://update.code.visualstudio.com/latest/linux-deb-x64/stable"
DLLINK_XAMPP="https://www.apachefriends.org/xampp-files`${DLDR} "https://sourceforge.net/projects/xampp/rss?path=/XAMPP%20Linux" | tac | tac | grep -m 1 "\/XAMPP Linux\/" | grep -Eo '\/[0-9.]{3,}\/xampp\-linux\-x64\-[0-9.-]{3,}installer.run'`"

## Visual Studio Code
echo ""
echo "Running task 1: Visual Studio Code..."
FNAME=`cat /proc/sys/kernel/random/uuid`.deb
${DLDR} ${DLLINK_VSC} > /tmp/${FNAME}
sudo apt install -y /tmp/${FNAME}

## XAMPP
echo ""
echo "Running task 2: XAMPP..."
FNAME=`cat /proc/sys/kernel/random/uuid`
${DLDR} ${DLLINK_XAMPP} > /tmp/${FNAME}
chmod a+x /tmp/${FNAME}
sudo /tmp/${FNAME} --mode unattended

## Git
echo ""
echo "Running task 3: Git..."
sudo apt install -y git

echo ""
echo "Done!"
