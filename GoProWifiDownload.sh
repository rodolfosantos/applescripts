# This batch script retrieves all your photos and videos from GoPro camera thought Wifi
# The script ignores existing files in your GOPRO folder
# @author Rodolfo Santos - rodolfoahsantos@gmail.com

# connect to GoPro Wifi network (only in OSX)
networksetup -setairportnetwork en1 $GOPRO_SSID $GOPRO_PW

# download all photos
wget -r -nd -A JPG -S -N -P GOPRO http://10.5.5.9:8080/videos/DCIM/100GOPRO/
# download all videos
wget -r -nd -A MP4 -S -N -P GOPRO http://10.5.5.9:8080/videos/DCIM/100GOPRO/
