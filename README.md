# DASH Video Streaming – CSI_6_SIT

## Overview
End-to-end DASH video streaming experiment using FFmpeg, iPerf, and Linux tc.

## Requirements
- Ubuntu 20.04 VM (Server + Client)
- FFmpeg 4.2.7+
- iPerf
- iproute2 (tc)
- Apache Web Server

## Installation
```bash
sudo apt update
sudo apt install ffmpeg iperf iproute2 apache2 -y
```

## Project Structure
- /screenshots → All experiment screenshots
- /configs     → Network emulation scripts
- /dash_output → DASH manifest and chunks

## Deployment
1. Run transcoding commands
2. Generate DASH manifest
3. Copy dash_output to /var/www/html/
4. Open player.html in browser
