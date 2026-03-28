#!/usr/bin/env bash
boot=$(sysctl -n kern.boottime | awk '{print $4}' | tr -d ',')
now=$(date +%s)
diff=$((now - boot))
days=$((diff / 86400))
hours=$(((diff % 86400) / 3600))
mins=$(((diff % 3600) / 60))
result=""
[ "$days" -gt 0 ] && result="${days}d "
[ "$hours" -gt 0 ] && result="${result}${hours}h "
[ "$mins" -gt 0 ] && result="${result}${mins}m"
printf '%s' "$result"
