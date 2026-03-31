#!/bin/sh
./toolbox --tools-file="tools.yaml" --port=5000 &
sleep 4
cd /app && adk web --host 0.0.0.0 --port ${PORT:-8080} .
