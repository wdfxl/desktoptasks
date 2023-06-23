#!/bin/bash
scp -r ./system/* /etc/systemd/system
systemctl daemon-reload
systemctl enable desktop_player.service
systemctl enable desktop-updater.path
systemctl enable desktop-updater-periodic.timer
systemctl enable desktop-updater.service
systemctl enable player-restart.service

echo "Services Update Succesfull"
