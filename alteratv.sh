#!/bin/bash

sed -i '/SOFTWARE_CHROMIUM_AUTOSTART_URL=/d' /boot/dietpi.txt && sed -i '/SOFTWARE_CHROMIUM_RES_Y=/a SOFTWARE_CHROMIUM_AUTOSTART_URL='$1'' /boot/dietpi.txt && reboot

