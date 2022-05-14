# Vivado Hardware design for MicroZed 7020 board

## Simplest hw design

* Install board definition file:
    * copy 'board' folder to `$VIVADO/data`;

* create a project with this board: MicroZed 7020:

* Block Design/Diagram: add Zynq PS

* define system: define PS banl voltages, buses, clocks, fabric clock, DDR3 settings and 
external peripherals, MIO configuration:
    * run MicroZed_PS_propertied_v03.tcl in Vivado
    check zynq PS design: ethernet, USB, DDR3;

* declare system external I/Os: declare DDR, fixed IO(MIO, clock, reset and DDR reference voltage)
    * No constrain file is needed: all are fixed for PS system;
    * `run design automation`;

* Validate design;

* Create HDL wrapper;

* Generate bitstream;

* export HW design: *.xsa file;


## Notes

** xsa is a package file, can be opened by rar:
It contains the bitstream, ps_init.tcl and some XML files;

** PS is hard core
Hard core means everything in PS are fixed, can't be changed. So hw definition is not manidate for software 
development for this chip;

** Connecting eMMC’s Card Detect
Unlike previous board definitions in Vivado 2014.x, the schema in 2015.1 does not
support adding special connections directly in the board definitions. For this reason, if
you plan on using the PicoZed eMMC in Linux, you need to connect the CDn (Card
Detect) signal for the SDIO1 controller to a constant 0.
This can be done with the following TCL commands once you have created the block
design, run block automation, and applied the preset. Alternatively, source the
Connect_eMMC_CD.tcl file attached to this archive.

```
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells GND]
connect_bd_net [get_bd_pins GND/dout] [get_bd_pins processing_system7_0/SDIO1_CDN]
```

## Questions
** what is ps7? and ps7_init?

