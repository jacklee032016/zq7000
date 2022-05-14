# readme for PetaLinux
May 13, 2022

## PetaLinux Installation


###* add `tftp` server
sudo apt install tftpd-hpa

sudo systemctl status tftpd-hpa

sudo nano /etc/default/tftpd-hpa
sudo chown tftp:tftp /opt/tftp



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

## create project from a BSP file

```
Create project from PetaLinux Project BSP:
  $ petalinux-create -t project -s <PATH_TO_PETALINUX_PROJECT_BSP>

Create project from PetaLinux Project BSP and specify the TMPDIR PATH:
  $ petalinux-create -t project -s <PATH_TO_PETALINUX_PROJECT_BSP> --tmpdir <TMPDIR PATH>

Create project from template and specify the TMPDIR PATH:
  $ petalinux-create -t project -n <PROJECT> --template <TEMPLATE> --tmpdir <TMPDIR PATH>

Create project from template:
For microblaze project,
  $ petalinux-create -t project -n <PROJECT> --template microblaze
For zynq project,
  $ petalinux-create -t project -n <PROJECT> --template zynq
For zynqMP project,
  $ petalinux-create -t project -n <PROJECT> --template zynqMP
For versal project,
  $ petalinux-create -t project -n <PROJECT> --template versal
```  


petalinux-create -t project -s ../xilinx-zc702-v2022.1-04191534.bsp 


sudo apt-get install libtinfo5


petalinux-package --boot --format BIN --fsbl <FSBL image> --fpga <FPGA bitstream>
--u-boot

  