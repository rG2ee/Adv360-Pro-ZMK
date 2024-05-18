#!/usr/bin/env bash

set -ex

echo "script executed" > /home/user/status.txt
# Starting Tailscale daemon automatically if not running.

# Überprüft, ob der Tailscale-Daemon läuft und gibt das Ergebnis aus.
if pgrep -x "tailscaled" > /dev/null; then
  echo "TailscaleD-Status: Running" >> /home/user/status.txt
  RUNNING=true
else
  echo "TailscaleD-Status: Not running" >> /home/user/status.txt
  RUNNING=false
fi

if [ "$RUNNING" = false ]; then
    sudo tailscaled > /dev/null 2>&1 &
    disown
    echo "tailscaled has been started" >> /home/user/status.txt
    sleep 5
fi

source /home/user/.env/.env.tailscale
sudo tailscale up --authkey $TAIL_SCALE_AUTH_KEY --hostname=devcontainer-`hostname`  > /home/user/log.txt 2>&1
sudo rm -r /home/user/.env
sudo rm /home/user/postCreateCommand.sh