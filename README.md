# postmarketOS Termux

Experimental unofficial installer for running [postmarketOS](https://postmarketos.org) edge with [Phosh](https://wiki.postmarketos.org/wiki/Phosh) inside of [Termux](https://termux.dev).

Big thanks to these guides for making it pretty easy for me to make an installer:
- [Running postmarketOS on Android Termux proot without flashing a custom rom](https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot/)
- [Existing Alpine installation](https://wiki.postmarketos.org/wiki/Existing_Alpine_installation)

While this ["device"](https://wiki.postmarketos.org/wiki/PRoot_aarch64_(proot-aarch64)) is marked as tested and on the official wiki, it is very extremely incomplete, missing device packages (unlikely to get any though) and all features (Internal storage, 3D Acceleration, Audio, FDE) are marked as untested as of writing this.

This installer script has been only tested on Android 14 with an aarch64 processor. It may work on Android 12-13 as well, lower versions might have issues with the VirGL renderer and have poor 3D Acceleration performance if VirGL is unsuccessful. Devices with armv7/armhf processors are likely not to work. Root is not required for this installer.

## Install command

`curl -o install-pmos.sh https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/refs/heads/main/install.sh && chmod +x install-pmos.sh && ./install-pmos.sh`
