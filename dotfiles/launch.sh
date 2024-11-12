#!/usr/bin/env sh

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
polybar main 2>&1 | tee -a /tmp/polybar1.log &
disown

echo "Bars launched..."

## Terminate already running bar instances
#polybar-msg cmd quit
#
#polybar main &
#
## Wait until the processes have been shut down
#while pgrep -x polybar >/dev/null; do sleep 1; done
#
## Launch bars
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar main &
#done
#
