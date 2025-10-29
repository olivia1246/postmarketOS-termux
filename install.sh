#!/bin/bash
clear
echo "Welcome to the unofficial postmarketOS Termux installer."
echo ""

if command -v pd &>/dev/null; then
    if pd list | grep -q 'alpine'; then
        echo "Alpine Linux seems to be already installed via proot-distro. Please remove it before proceeding."
        exit 1
    fi
fi

echo "Updating packages and installing dependencies..."
pkg update > /dev/null 2>&1
pkg upgrade -y > /dev/null 2>&1
pkg install x11-repo -y > /dev/null 2>&1
pkg install pulseaudio wget xkeyboard-config virglrenderer-android proot-distro termux-x11-nightly termux-am -y > /dev/null 2>&1

echo "Installing Alpine Linux using proot-distro..."
pd install alpine > /dev/null 2>&1

echo "Converting Alpine to postmarketOS (this may take 10-20+ minutes)..."
pd sh alpine --shared-tmp -- sh -c '
    echo "  Setting up repositories..."
    cat <<EOF > /etc/apk/repositories 
https://mirror.postmarketos.org/postmarketos/master
https://dl-cdn.alpinelinux.org/alpine/edge/main
https://dl-cdn.alpinelinux.org/alpine/edge/community
https://dl-cdn.alpinelinux.org/alpine/edge/testing
EOF
    
    echo "  Adding postmarketOS keys..."
    apk add -u --allow-untrusted postmarketos-keys > /dev/null 2>&1
    
    echo "  Updating package database..."
    apk update > /dev/null 2>&1
    
    echo "  Upgrading system..."
    apk upgrade > /dev/null 2>&1
    
    echo "  Installing postmarketOS packages..."
    apk add postmarketos-base openbox cage postmarketos-ui-phosh postmarketos-tweaks firefox mobile-config-firefox font-noto font-noto-cjk font-noto-cjk-extra font-noto-emoji > /dev/null 2>&1
    
    echo "  Creating user account..."
    adduser -g wheel,storage,video,audio -D user > /dev/null 2>&1
    
    echo "  Setting timezone..."
    ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
    
    echo "  Configuring sudo..."
    apk add sudo > /dev/null 2>&1
    echo "user ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null

    echo "  Downloading start script part 2..."
    cd /home/user
    if wget -q https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/refs/heads/main/start-part1.sh -O start-pmos-part2.sh; then
        chmod +x start-pmos-part2.sh
        chown user:user start-pmos-part2.sh
        echo "Start script part 2 downloaded."
    else
        echo "Could not download start script part 2."
    fi
'

echo "Downloading start script part 1..."
if wget -q https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/refs/heads/main/start-part1.sh -O start-pmos-part1.sh; then
    chmod +x start-pmos-part1.sh
    echo "Start script part 1 downloaded."
else
    echo "Could not download start script part 1."
fi

clear
echo "postmarketOS installer has completed (hopefully successfully)!"
echo ""
echo "To start:"
echo "1. Run: ./start-pmos-part1.sh"
echo "2. Run inside the proot: ./start-pmos-part2.sh"
echo "3. Open Termux-X11 app"
echo ""
echo "Recommended: Check the guide at https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/"
