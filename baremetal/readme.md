# Bare Metal and FSBL

## Overview

FSBL is loaded into OCM(OnChip Memry), and run in OCM;
   * link script of fsbl:
   
```
   ps7_ram_0_S_AXI_BASEADDR : ORIGIN = 0x00000000, LENGTH = 0x00030000
   ps7_ram_1_S_AXI_BASEADDR : ORIGIN = 0xFFFF0000, LENGTH = 0x0000FE00
```

Bare Metal app can run in OCM, DDR or even XIP in flash(zynq support XIP in flash)
   * link script of app(hello world)
```
   ps7_ddr_0 : ORIGIN = 0x100000, LENGTH = 0x3FF00000
   ps7_qspi_linear_0 : ORIGIN = 0xFC000000, LENGTH = 0x1000000
   ps7_ram_0 : ORIGIN = 0x0, LENGTH = 0x30000
   ps7_ram_1 : ORIGIN = 0xFFFF0000, LENGTH = 0xFE00
```

[Detail about memory map and boot flow of zynq700](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842377/Zynq-7000+AP+SoC+Boot+-+Booting+and+Running+Without+External+Memory+Tech+Tip)


## header files

only include/xparameters.h is generated from hw definition, other header files are copied from their implementation folders;

## Usage

* install peta-linux;
* install bootgen: `sudo apt install bootgen-xlnx`;
* build and generate the binary file: `make`;


## further

* Add script to generate hw definition for this simplest hw;
* Change the app to use timer in PL and run without using DDR:
   * hw design;
   * SDK sw modules;

