# postmarketOS for Termux

Experimental unofficial rootless installer for running [postmarketOS](https://postmarketos.org) with [Phosh](https://wiki.postmarketos.org/wiki/Phosh) inside of [Termux](https://termux.dev).

## Prerequisites

- [Termux:X11](https://github.com/termux/termux-x11)
- Minimum 3-4+ GB of free storage
- Android 12+ (can run on 8+ but with limits)
  
<sub>*Check support for detailed compatibility information.*</sub>

## Support

While this ["device"](https://wiki.postmarketos.org/wiki/PRoot_aarch64_(proot-aarch64)) is marked as tested and on the official wiki, it is very extremely incomplete, missing device packages and all features are marked as untested as of writing this.

## Issues

Android 12+ is recommended due to the VirGL renderer. Android 11 and lower do not support VirGL on Termux and crash upon executing the UI. You can disable VirGL on those versions and it will work.

Phosh may occasionally fail to start. When this happens, a full Termux restart is often required, and it may take several attempts to successfully run the second-part script. In some cases it may run Phosh only once or twice and never again, I think this is fixable but I'm not sure how to do that at the moment.

## Plans

Alternative installation script using "wayvnc" instead of nesting Wayland inside of X11 with cage. Would increase stability and lessen crashes however display-scaling and visual quality will be impacted. Would also technically allow postmarketOS to be ran on as low as Android 5+ devices with VirGL disabled.

## Credits

Big thanks to these guides for making it pretty easy for me to make an installer:
- [Running postmarketOS on Android Termux proot without flashing a custom rom](https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot)
- [Existing Alpine installation](https://wiki.postmarketos.org/wiki/Existing_Alpine_installation)

## Install

```bash
curl -sSL https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/main/install.sh | bash
```
