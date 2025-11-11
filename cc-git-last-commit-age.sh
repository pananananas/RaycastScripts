#!/usr/bin/env bash
# macOS / bash
set -euo pipefail

# Sprawdź, czy to repo git
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "no-git"; exit 0; }

# Timestamp ostatniego commita na aktualnym branchu
last_ts=$(git log -1 --format=%ct 2>/dev/null || echo 0)
now_ts=$(date +%s)

if [ "$last_ts" -eq 0 ]; then
  echo "no-commits"
  exit 0
fi

diff=$(( now_ts - last_ts ))

# Konwersja na największą sensowną jednostkę
days=$(( diff / 86400 ))
hrs=$(( (diff % 86400) / 3600 ))
mins=$(( (diff % 3600) / 60 ))

if [ $days -gt 0 ]; then
  printf "Last: %dd" "$days"
elif [ $hrs -gt 0 ]; then
  printf "Last: %dh %dm" "$hrs" "$mins"
else
  printf "Last: %dm" "$mins"
fi
