#!/bin/bash

set -e

echo "=== Update dan install snapd ==="

sudo apt update && sudo apt upgrade -y
sudo apt install snapd -y

echo "=== Install Mir Kiosk dan WPE WebKit ==="
sudo snap install mir-kiosk
sudo snap install wpe-webkit-mir-kiosk

echo "=== Set URL kiosk ke https://cudocomm.com ==="
sudo snap set wpe-webkit-mir-kiosk url="https://cudocomm.com"

# Jika ingin orientasi portrait, uncomment baris di bawah:
 echo "=== Set display ke mode portrait ==="
 sudo snap set mir-kiosk display-config='{
   "display": {
     "orientation": "right"
   }
 }'

echo "=== Konfigurasi autostart & snap behavior ==="
sudo snap set system refresh.retain=2
