#!/bin/bash 
# This script will probably onle work for a mac
# You should run this command to disable spotlight:
# sudo mdutil -a -i off
# To re-enable:
# sudo mdutil -a -i on


# must be 8 characters or less
USB_NAME="DESIG"
OLD_NAME=DISK_IMG

date_append="$(date +%s)"
date_append=${date_append#1399}

USB_NAME=$USB_NAME$date_append
path_to_usb=/Volumes/$USB_NAME/

echo "Renaming USB drive to $USB_NAME"
echo $USB_NAME
diskutil rename $OLD_NAME $USB_NAME

echo "copying files over"
#cp -R USB/*.* /Volumes/$USB_NAME/
rsync -r --progress USB/ $path_to_usb
sync

echo "Ejecting drive."
diskutil eject $USB_NAME
#umount -f /Volumes/$USB_NAME

echo "Done!"
say "Done"