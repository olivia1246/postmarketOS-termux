# postmarketOS for Termux

Experimental unofficial rootless installer for running [postmarketOS](https://postmarketos.org) with [Phosh](https://wiki.postmarketos.org/wiki/Phosh) inside of [Termux](https://termux.dev).

## Prerequisites

- [Termux:X11](https://github.com/termux/termux-x11)
- Minimum 3-4+ GB of free storage
- Android 12+
- aarch64 processor
  
<sub>*Check support for detailed compatibility information.*</sub>

## Support

While this ["device"](https://wiki.postmarketos.org/wiki/PRoot_aarch64_(proot-aarch64)) is marked as tested and on the official wiki, it is very extremely incomplete, missing device packages and all features are marked as untested as of writing this.

This installer script has been only tested on rootless Android 14 with an aarch64 processor. It should work on rootless Android 12+ but lower versions might have issues with the VirGL renderer. Devices with armv7/armhf processors are untested but may work if the before mentioned conditions are also met.

## Credits

Big thanks to these guides for making it pretty easy for me to make an installer:
- [Running postmarketOS on Android Termux proot without flashing a custom rom](https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot)
- [Existing Alpine installation](https://wiki.postmarketos.org/wiki/Existing_Alpine_installation)

## Install

```bash
curl -sSL https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/main/install.sh | bash
```
