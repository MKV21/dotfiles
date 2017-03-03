#!/bin/sh

STATUS=$(cat /sys/class/drm/card1-DP-1/status)
ENABLED=$(cat /sys/class/drm/card1-DP-1/enabled)

if [ "$STATUS" = "connected" ]; then
    # only enable display if it is not already enabled (might be caused by multiple udev events)
    if [ "$ENABLED" = "disabled" ]; then
        # displays connected, set them up
        xrandr --output HDMI-1-2 --off --output eDP-1-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-1-1 --off --output DP-1-1 --mode 3840x2160 --pos 3840x0 --rotate normal --output DP-1-2 --mode 3840x2160 --pos 7680x0 --rotate normal

        # restart i3 to have correct formatting, but wait to make sure displays are set up
        sleep 2

        # move workspaces
        i3-msg "[workspace=\"2:  Messages\"] move workspace to output DP-1-2"
        i3-msg "[workspace=\"3:  Chrome\"] move workspace to output DP-1-1"

        # bring workspaces into focus
        i3-msg workspace "2:  Messages"
        i3-msg workspace "3:  Chrome"
        
        i3-msg restart
    fi
else
    # displays no longer connected
    xrandr --output HDMI-1-2 --off --output DP-1-1 --off --output DP-1-2 --off --output --eDP-1-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal

    # restart i3 to have correct formatting, but wait to make sure displays are set up
    sleep 2
    i3-msg restart
fi
   
