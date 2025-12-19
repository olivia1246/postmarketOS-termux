#!/bin/bash
# Heavily inspired by the guide from https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/
pulseaudio --start --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1
virgl_test_server_android &
pd sh alpine --user user --shared-tmp
