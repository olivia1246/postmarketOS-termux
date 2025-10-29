#!/bin/bash
# Heavily inspired by the guide from https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/
export DISPLAY=:0
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
virgl_test_server_android &
termux-x11 :0 &
pd sh alpine --user user --shared-tmp -- bash -c '
    export DISPLAY=:0
    export XDG_RUNTIME_DIR=/tmp
    export GALLIUM_DRIVER=virpipe
    export MESA_GL_VERSION_OVERRIDE=4.0
    openbox &
    cage phoc -E "/usr/libexec/phosh"
'
