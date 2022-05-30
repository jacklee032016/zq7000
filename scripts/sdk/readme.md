
## Terms

**Platform project**

**domain**

domain create [options]

Create a new domain in active platform. 

**sysproj**

**repository**

**app Project**

## Commands

Enter into `Xilinx Software Command Line Tool
xsct%`

`getaddrmap zq7First.xsa  ps7_cortexa9_0`

`getperipherals zq7First.xsa  ps7_cortexa9_0`

`getprocessors zq7First.xsa 
ps7_cortexa9_0 ps7_cortexa9_1`

`repo -os|-libs|-drivers|-apps`


`domain list`

`sysproj list`


## Usage

* copy *.xsa to current folder;
* enter `Software Command Line Tool`;
* enter into this folder;
* modify hw name and platform name, etc. in swAPp.tcl;
* `source swApp.tcl`;
* copy BOOT.bin to sd card and try;



## References

[vitis command line: xsct](https://docs.xilinx.com/r/en-US/ug1400-vitis-embedded/Vitis-Projects)

This statement can't work even after selected active platform:

```
platform config -extra-compiler-flags fsbl "-DFSBL_DEBUG_INFO [platform config -extra-compiler-flags fsbl] "

```