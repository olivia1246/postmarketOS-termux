#!/bin/bash
# Heavily inspired by the guide from https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/
export XDG_RUNTIME_DIR=/tmp
export GALLIUM_DRIVER=virpipe
export MESA_GL_VERSION_OVERRIDE=4.0
export WLR_BACKENDS=headless
export WLR_LIBSEAT_BACKEND=noop
export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
pkill -9 -f "phosh"
pkill -9 -f "phoc"
pkill -9 -f "gnome-remote-desktop-daemon"
pkill -9 -f "dbus-launch"
pkill -9 -f "dbus-daemon"
eval $(dbus-launch --sh-syntax)
echo "D-Bus session: $DBUS_SESSION_BUS_ADDRESS"
echo "[1/4] Starting Phosh..."
phoc -E "/usr/libexec/phosh" &
echo "[2/4] Waiting for phosh to initialize..."
COUNT=0
while ! pgrep -n "phosh" > /dev/null; do
    sleep 1
    ((COUNT++))
    if [ $COUNT -gt 15 ]; then echo "Phosh timed out."; exit 1; fi
done
echo "Found phosh."
export WAYLAND_DISPLAY=$(ls $XDG_RUNTIME_DIR/wayland-* -t | head -n1 | xargs basename)
echo "Detected display: $WAYLAND_DISPLAY"
echo "[3/4] Launching RDP Daemon..."
/usr/libexec/gnome-remote-desktop-daemon &
COUNT=0
while ! pgrep -n "gnome-remote-desktop-daemon" > /dev/null; do
    sleep 1
    ((COUNT++))
    if [ $COUNT -gt 10 ]; then echo "RDP Daemon timed out."; exit 1; fi
done
echo "RDP Daemon is active."
sleep 3
RDP_PASS=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c16)
dbus-send --type=method_call --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.ListNames > /dev/null
echo "$RDP_PASS" | grdctl --headless rdp set-credentials user "$RDP_PASS"
grdctl --headless rdp enable
grdctl --headless rdp disable-view-only
echo "Connect to 127.0.0.1:3389 using your RDP client."
echo "RDP password for this session: $RDP_PASS"
