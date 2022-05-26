

# pins in PS system
May 25, 20202

* DDR
* Fixed_IO:
    * ddr_vrn
    * ddr_vrp
    * mio[53:0]: uart, ethernet, usb-otg, uSD, QSPI, PMOD (only for this board)
* Power_On_Rset:ps_porb
* PS_subsystem_reset:ps_srstb

# MIO, Multipurpose IO

* connect to other components: all external devices in PS side
* setting about boot modes: MIO[8:2]. After boot, they can be used for other purpose
* 2 voltage banks: MIO0[0:15]; MIO1[16:53]; LVCMOS and HSTL types

## customize MIO
* Peripheral IO pins: select pin for one of the devices
* MIO Configuration: show IO configuration

## EMIO, Extended MIO
* exist in PL side;
* maximum 64 additional GPIO pins (not in the Fixed IOs);
* all devices uses EMIO will be shown on PS block diagram;

# LED and PB(Push Button) of MicroZed7020 board

* LED on MIO[47], PB on MIO[51]; other GPIO pins MIO[0], [9:15];
* All GPIO pins are not configured in MIO configuration;

Usage of LED and PB
* All MIO: pull up disabled; slew: slow.
* PB: pull-down resister; push, then connect to VCC0;
* LED: logic high, LED ON.

Because LED and PB use MIO (not EMIO), and MIO is fixed in PS side, no other configuration is needed to generate hw definition; In order to use LED and PB by software, only call the driver.
