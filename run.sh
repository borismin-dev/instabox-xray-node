#!/bin/bash
pgrep -f 'home/xray/xray run' >/dev/null || (cd /data/home/xray && nohup /data/home/xray/xray run -c config.json > xray.log 2>&1 &)
