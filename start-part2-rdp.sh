#!/bin/bash
# Heavily inspired by the guide from https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/
export XDG_RUNTIME_DIR=/tmp
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0
phoc -E "/usr/libexec/phosh" &
RDP_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c16)
echo "$RDP_PASS" | grdctl --headless rdp set-credentials
grdctl --headless rdp enable
grdctl --headless rdp disable-view-only
clear
echo "Connect to 127.0.0.1:3389 using your RDP client."
echo "RDP password for this session: $RDP_PASS"