#!/bin/bash
sleep 1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -A file_mapping
file_mapping=(
    [00]="11-Mid-Night.png"
    [01]="11-Mid-Night.png"
    [02]="12-Late-Night.png"
    [03]="12-Late-Night.png"
    [04]="12-Late-Night.png"
    [05]="01-Early-Morning.png"
    [06]="01-Early-Morning.png"
    [07]="02-Mid-Morning.png"
    [08]="03-Late-Morning.png"
    [09]="03-Late-Morning.png"
    [10]="03-Late-Morning.png"
    [11]="04-Early-Afternoon.png"
    [12]="05-Mid-Afternoon.png"
    [13]="06-Late-Afternoon.png"
    [14]="06-Late-Afternoon.png"
    [15]="06-Late-Afternoon.png"
    [16]="06-Late-Afternoon.png"
    [17]="07-Early-Evening.png"
    [18]="08-Mid-Evening.png"
    [19]="09-Late-Evening.png"
    [20]="10-Early-Night.png"
    [21]="10-Early-Night.png"
    [22]="11-Mid-Night.png"
    [23]="11-Mid-Night.png"
)

hour=$(date +%H)
file="${file_mapping[$hour]}"

monitor_list=($(hyprctl monitors | grep -o 'Monitor [^:]*' | awk '{print $2}'))
for monitor in "${monitor_list[@]}"
do
    hyprctl hyprpaper wallpaper ${monitor},"$DIR/$file"
done

echo "Wallpaper set to $file"
