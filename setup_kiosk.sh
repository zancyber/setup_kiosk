#!/bin/bash

set -e

echo "=== Update dan install snapd ==="
sudo apt update && sudo apt upgrade -y
sudo apt install snapd -y

echo "=== Install Mir Kiosk dan WPE WebKit ==="
sudo snap install mir-kiosk
sudo snap install wpe-webkit-mir-kiosk

echo "=== Set URL kiosk ke https://localhost:8080 ==="
sudo snap set wpe-webkit-mir-kiosk url="https://localhost:8080"

# Jika ingin orientasi portrait, uncomment baris di bawah:
# echo "=== Set display ke mode portrait ==="
# sudo snap set mir-kiosk display-config='{
#   "display": {
#     "orientation": "right"
#   }
# }'

echo "=== Konfigurasi autostart & snap behavior ==="
sudo snap set system refresh.retain=2

echo "=== Menonaktifkan logo Ubuntu dan splash pelangi ==="

# 1. Edit /boot/firmware/cmdline.txt
# Backup dulu
sudo cp /boot/firmware/cmdline.txt /boot/firmware/cmdline.txt.backup

# Hapus "splash" dan tambahkan opsi quiet dan logo=none
sudo sed -i 's/ splash//g' /boot/firmware/cmdline.txt
sudo sed -i 's/$/ quiet splash vt.global_cursor_default=0 logo.nologo loglevel=0/' /boot/firmware/cmdline.txt

# 2. Nonaktifkan rainbow splash screen
echo "disable_splash=1" | sudo tee -a /boot/firmware/config.txt > /dev/null

echo "=== [SELESAI] Silakan reboot untuk melihat hasil ==="
