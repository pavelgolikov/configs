#!/usr/bin/env bash
#
# tmux setup: new windows, panes and sessions start in /project/6107991/golikovp.
#
# HOW TO USE
#   Run:  bash tmux_setup/install.sh
#
# WHAT IT DOES
#   - Copies tmux.conf to ~/.tmux.conf.
#   - Loads it into the running tmux server, if there is one, so open sessions
#     use it without a restart.

set -euo pipefail
cd "$(dirname "$0")"

cp tmux.conf ~/.tmux.conf
if tmux has-session 2>/dev/null; then
  tmux source-file ~/.tmux.conf
fi
