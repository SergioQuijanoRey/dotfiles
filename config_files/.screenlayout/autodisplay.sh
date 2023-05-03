#!/usr/bin/env bash
# Script to autoselect the correct screen layout

dual_display="$HOME/.screenlayout/dualdisplay.sh"
mono_display="$HOME/.screenlayout/monodisplay.sh"
error_log="$HOME/autodisplay.error"

# Var to hold the number of available displays
result=$(xrandr | grep -w "connected" | wc -l)

# We set the config depending on the number of displays available
if [ $result == 1 ]
then
    $mono_display
elif [ $result == 2 ]
then
    $dual_display
else
    echo "ERROR: $(date)"
    echo "No configuration available for this number of displays" >> $error_log
    echo "" >> $errro_log
fi
