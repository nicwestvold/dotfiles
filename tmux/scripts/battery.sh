#!/usr/bin/env bash
batt_info=$(pmset -g batt 2>/dev/null)
pct=$(echo "$batt_info" | grep -Eo '[0-9]+%' | head -1 | tr -d '%')

[ -z "$pct" ] && exit 0

if echo "$batt_info" | grep -q 'AC Power'; then
  # Charging
  icon=$'\U000F0084'
elif [ "$pct" -ge 95 ]; then
  icon=$'\U000F0078'
elif [ "$pct" -ge 85 ]; then
  icon=$'\U000F0082'
elif [ "$pct" -ge 75 ]; then
  icon=$'\U000F0081'
elif [ "$pct" -ge 65 ]; then
  icon=$'\U000F0080'
elif [ "$pct" -ge 55 ]; then
  icon=$'\U000F007F'
elif [ "$pct" -ge 45 ]; then
  icon=$'\U000F007E'
elif [ "$pct" -ge 35 ]; then
  icon=$'\U000F007D'
elif [ "$pct" -ge 25 ]; then
  icon=$'\U000F007C'
elif [ "$pct" -ge 15 ]; then
  icon=$'\U000F007B'
else
  icon=$'\U000F007A'
fi

printf '%s %s%%' "$icon" "$pct"
