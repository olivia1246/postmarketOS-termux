#!/bin/bash
# Heavily inspired by the guide from https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/
export DISPLAY=:0
export XDG_RUNTIME_DIR=/tmp
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0
openbox &
cage phoc -E "/usr/libexec/phosh"
