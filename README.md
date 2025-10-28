# postmarketOS Termux

Experimental unofficial installer for running postmarketOS with Phosh inside of Termux on Android.

Big thanks to these guides for making it pretty easy for me to make an installer script for Termux:
- [Running postmarketOS on Android Termux proot without flashing a custom rom](https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/)
- [Existing Alpine installation](https://wiki.postmarketos.org/wiki/Existing_Alpine_installation)

While this ["device"](https://wiki.postmarketos.org/wiki/PRoot_aarch64_(proot-aarch64)) is marked as tested and on the official wiki, it is very extremely incomplete, missing device packages (unlikely to get any though) and all features (Internal storage, 3D Acceleration, Audio, FDE) are untested as of writing this.

## Install command

`curl -o install-pmos.sh https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/refs/heads/main/install.sh && chmod +x install-pmos.sh && ./install-pmos.sh`
