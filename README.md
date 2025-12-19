# postmarketOS for Termux

Experimental unofficial rootless installer for running [postmarketOS](https://postmarketos.org) with [Phosh](https://wiki.postmarketos.org/wiki/Phosh) inside [Termux](https://termux.dev).

## Prerequisites

- [Termux:X11](https://github.com/termux/termux-x11) or an RDP client  
- 3–4 GB+ of free storage  
- Android version requirements:  
  - Termux:X11: Android 12+ (Android 8+ supported with software rendering)  
  - RDP: Android 12+ (Android 5+ supported with software rendering)  

<sub>*Check support for detailed compatibility information.*</sub>

## Support

While this ["device"](https://wiki.postmarketos.org/wiki/PRoot_aarch64_(proot-aarch64)) is marked as tested on the official wiki, it is extremely incomplete: device packages are missing and all features are untested as of writing.

## Issues

- Android 12+ recommended due to VirGL renderer support.  
- Android 11 and lower do not support VirGL on Termux and may crash the UI. You can disable VirGL, but only software rendering will be available.

### Termux:X11 Specific

- Phosh may occasionally fail to start.  
- If it fails, a full Termux restart is often required.  
- Sometimes Phosh may run only once or twice. This may be fixable, but currently there is no known solution.

## Credits

Special thanks to these guides for making the installer possible:  

- [Running postmarketOS on Android Termux proot without flashing a custom ROM](https://ivonblog.com/en-us/posts/postmarketos-in-termux-proot)  
- [Existing Alpine installation](https://wiki.postmarketos.org/wiki/Existing_Alpine_installation)  

## Install

### Termux:X11
```
curl -sSL https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/main/install.sh | bash
```

### RDP

```
curl -sSL https://raw.githubusercontent.com/olivia1246/postmarketOS-termux/main/install-rdp.sh | bash
```
