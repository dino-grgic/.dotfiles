#!/bin/bash

# Check if WORK_MODE environment variable is set
if [ "$WORK_MODE" = "1" ]; then
    exec i3blocks -c ~/.config/i3blocks/config.work
else
    exec i3blocks -c ~/.config/i3blocks/config.personal
fi
