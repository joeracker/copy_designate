#!/bin/bash 
# This script will probably onle work for a mac
# You should run this command to disable spotlight:
# sudo mdutil -a -i off
# To re-enable:
# sudo mdutil -a -i on

<<<<<<< HEAD
# path to docs
SOURCE_DATA=usb_contents/

# must be 8 characters or less
USB_NAME="DESIG"

OLD_NAME=DISK_IMG
OLD_NAME2="NO NAME"
=======

# must be 8 characters or less
USB_NAME="DESIG"
OLD_NAME=DISK_IMG
>>>>>>> 4f5d7cf437e56c195f7fccc9f05a31c314d0c14b

date_append="$(date +%s)"
date_append=${date_append#1399}

USB_NAME=$USB_NAME$date_append
path_to_usb=/Volumes/$USB_NAME/

echo "Renaming USB drive to $USB_NAME"
echo $USB_NAME
diskutil rename $OLD_NAME $USB_NAME

echo "copying files over"
#cp -R USB/*.* /Volumes/$USB_NAME/
<<<<<<< HEAD
rsync -r --progress $SOURCE_DATA $path_to_usb
=======
rsync -r --progress USB/ $path_to_usb
>>>>>>> 4f5d7cf437e56c195f7fccc9f05a31c314d0c14b
sync

echo "Ejecting drive."
diskutil eject $USB_NAME
#umount -f /Volumes/$USB_NAME

echo "Done!"
say "Done"