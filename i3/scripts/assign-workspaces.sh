#!/bin/bash
# Dynamically assign workspaces to monitors based on EDID manufacturer
# This script detects monitors by vendor name instead of port (DP-0, HDMI-1, etc.)

# Function to get output name for a given manufacturer pattern in EDID
get_output_by_edid() {
    local search_pattern="$1"
    
    xrandr --verbose 2>/dev/null | awk -v pattern="$search_pattern" '
    /^[A-Za-z]+-[0-9]+ connected/ {
        output = $1
    }
    /EDID:/ {
        in_edid = 1
        edid_data = ""
        next
    }
    in_edid && /^[[:space:]]+[0-9a-f]+$/ {
        gsub(/[[:space:]]/, "", $0)
        edid_data = edid_data $0
    }
    in_edid && !/^[[:space:]]+[0-9a-f]+$/ {
        in_edid = 0
        if (edid_data ~ pattern) {
            print output
            exit
        }
    }
    '
}

# EDID patterns for each manufacturer (from the EDID hex data)
# LG Electronics: vendor code "1e6d" appears at bytes 8-9
# AOC: vendor code "05e3" appears at bytes 8-9
# The monitor name is also embedded in the EDID

LG_OUTPUT=$(get_output_by_edid "1e6d")
AOC_OUTPUT=$(get_output_by_edid "05e3")

# Generate i3 config snippet and reload
CONFIG_FILE="$HOME/.config/i3/workspace-outputs.conf"

{
    echo "# Auto-generated workspace assignments - do not edit"
    [ -n "$LG_OUTPUT" ] && echo "workspace \"1\" output $LG_OUTPUT"
    [ -n "$AOC_OUTPUT" ] && echo "workspace \"9\" output $AOC_OUTPUT"
} > "$CONFIG_FILE"
