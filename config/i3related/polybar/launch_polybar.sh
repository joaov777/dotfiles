#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bottom_right &
    MONITOR=$m polybar --reload topbar &
    #MONITOR=$m polybar bottom_right 2>&1 | tee -a /tmp/polybar1.log & disown
  done
else
  polybar --reload bottom_right &
  polybar --reload topbar &
fi


# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
#polybar top_right 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bottom_right 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar top_left 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bottom_left 2>&1 | tee -a /tmp/polybar1.log & disown



echo "Bars launched..."

