import os
import subprocess


# path to data copying (relative to this script)
source_data="usb_contents/"

# New USB drive name (8 characters or less)
usb_name="DESIGNAT"


def get_subdirectories(a_dir):
    return [name for name in os.listdir(a_dir)
            if os.path.isdir(os.path.join(a_dir, name))]

usb_drives = []

for item in get_subdirectories("/Volumes/"):
	if "NO NAME" in item:
		usb_drives.append("NO NAME")
	elif "DISK_IMG" in item:
		usb_drives.append("DISK_IMG")
		#print item
		
for item in usb_drives: 
	print "====================================="
	print item	

	# rename the drive
	#print "Renaming drive"
	subprocess.call(["diskutil", "rename", item, usb_name]) 

	# copy the data
	#print "Copying data"
	path_to_usb = "/Volumes/%s" % usb_name
	subprocess.call(["rsync", "-r", "--progress", source_data, path_to_usb])

	# eject the drive
	#print "Ejecting drive"
	subprocess.call(["diskutil", "eject", usb_name])


subprocess.call(["say", "done"])	