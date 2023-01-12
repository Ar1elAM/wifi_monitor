#!/bin/bash

sudo airmon-ng stop wlan0
sudo iw wlan0 del
sudo airmon-ng stop wlan0mon
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode managed
sudo ifconfig wlan0 up
sudo service NetworkManager start