# FSBL, First Stage Boot Loader

## Overview of FSBL

* The software code and the FPGA configuration bit file can be stored within the same configuration-memory device attached to the PS"
   * only one QSPI flash can save bit(PL) and app(PS);

* BootROM run on OCM: OnChip Memory:
   * running from an on-chip, non-modifiable BootROM:
   * BootROM is configured by a header contained within off-chip, non-volatile memory
   * The header defines boot options such as execute in place (not possible from all memories), FSBL offset, and secure or not-secure configuration.

* the PL must be powered to activate the on-chip AES and SHA decryption hardware.

* The FSBL can configure the DDR SDRAM memory controller and other on-chip peripherals as defined in the Xilinx Platform Studio (XPS) hardware definition


### Overall the FSBL is responsible for

1. Initializing the PS with the information provided by XPS 
2. Programming the Zynq SoC’s PL if the appropriate bit file is provided 
3. Loading either a Second-Stage Boot Loader (SSBL) if an operating system is being used or loading a bare-metal application into DDR SDRAM 
4. Starting the execution of the SSBL or the bare-metal application

**Notes**
   * bit stream or FPGA/PL is not mandidate for PS run program;

* The Zynq SoC’s PL is programmed via the Processor Configuration Access Port (PCAP), which allows both partial and full PL configuration.

To create a bootable image for your Zynq solution you will need at least the following: 
1. Boot ROM Header – Controls Boot ROM settings such as execute in place, encryption, Quad SPI configuration, FSBL offset, and image length 
2. First stage boot loader 
3. PL configuration bit file 
4. Software application to run on the PS


On the Zynq SoC, these mode pins share the multiuse I/O pins on the PS side of the device. In all, 
there are seven mode pins mapped to MIO[8:2]. The first four pins define the boot mode; the fifth 
pin determines whether the PLL is used or not; and the sixth and seventh pins define the bank voltages 
on MIO bank 0 and bank 1 during power up. The voltage standard defined on MIO bank 0 and 1 can later 
be changed by the first stage boot loader if needed.


## References

[zynq700 OCM, Cache, Flash and Link scripts]
(https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18842377/Zynq-7000+AP+SoC+Boot+-+Booting+and+Running+Without+External+Memory+Tech+Tip)
