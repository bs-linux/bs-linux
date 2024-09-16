#!/usr/bin/env bash

# +------------------------------------+
#		Start Polybar
# +------------------------------------+
# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar top 2>&1 | tee -a /tmp/polybar2.log & disown
polybar left 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

# +------------------------------------+
#		Start Rofi
# +------------------------------------+
rofi &
# +------------------------------------+
#		Start Nitrogen
# +------------------------------------+
nitrogen --restore &
# +------------------------------------+
#		Start Picom
# +------------------------------------+
picom --experimental-backends -b --config ~/.config/picom/picom.conf &
# +------------------------------------+
#		Start Dunst
# +------------------------------------+
dunst &
