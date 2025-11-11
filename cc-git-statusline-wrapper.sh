#!/bin/bash

# Read JSON input once
input=$(cat)

# Get git info from existing script
git_info=$(echo "$input" | bash ~/.claude/statusline-command.sh)

# Get context percentage from ccstatusline
context_pct=$(echo "$input" | bunx ccstatusline)

# Combine outputs
printf '%s | %s' "$git_info" "$context_pct"
