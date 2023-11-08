#!/bin/bash

files=(
  "11-Mid-Night.png"
  "12-Late-Night.png"
  "01-Early-Morning.png"
  "02-Mid-Morning.png"
  "03-Late-Morning.png"
  "04-Early-Afternoon.png"
  "05-Mid-Afternoon.png"
  "06-Late-Afternoon.png"
  "07-Early-Evening.png"
  "08-Mid-Evening.png"
  "09-Late-Evening.png"
  "10-Early-Night.png"
)

#Timings for the backgrounds in order.
timing=(0 2 4 6 8 10 13 16 18 20 21)

hour=`date +%H`
hour=$(echo $hour | sed 's/^0*//')

for i in ${!timing[@]}; do # Loop through the wallpapers
    if [ ${timing[$i]} -gt $hour ]; then
	    feh --bg-fill $(dirname $0)/${files[i-1]}
	    echo "Wallpaper set to ${files[i-1]}"	
	    #betterlockscreen -u ~/temp/wallpaper/${files[i-1]} -r 1920x1080
      #echo "Betterlockscreen set to ${files[i-1]}"
      exit
    fi
done
