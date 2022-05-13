# readme for PetaLinux
May 13, 2022

## PetaLinux Installation

* download petalinux-v2022.1-04191534-installer.run from:
https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html

* install:
```
./petalinux-v2022.1-04191534-installer.run -d /opt/xilinx/sdk
```

* init environment:
```
source /opt/xilinx/sdk/settings.sh
```
* Validate:
```
echo $PETALINUX
```