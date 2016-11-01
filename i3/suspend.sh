#!/usr/bin/env bash

export DISPLAY=:0
sudo -u mike purple-remote "setstatus?status=offline"
sudo -u mike xautolock -locknow
sleep 1
sudo pm-suspend
sleep 1
sudo -u mike purple-remote "setstatus?status=available"

