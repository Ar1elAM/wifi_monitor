#!/bin/bash

airmon-ng check kill
airodump-ng wlan0
echo "Input BSSID:"
read BSSID
echo "Input channel:"
read cha
echo "Input filename with full file location:"
read fn
#you can also change the value to fl="/FULL/FILE/LOCATION/$fn-01.cap"
fl="$fn"
airodump-ng -c $cha --bssid $BSSID -w $fl wlan0
#if there is already a file with same name, it'll be 02.cap
echo -e "File created on\n$fl-01.cap"