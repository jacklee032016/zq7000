# Vitis and software debug

##Hardware definition file *.xsa
contains bit file, ps_init.tcl and xml for hw description

Create **platform project** from hw definition file;
    * bsp files
    * fsbl file: first stage boot loader

Create **application project** from **platform project**:
    * Hello World, etc.;
    * FresRTOS;
    * Linux;
    
##Debug 

Hardware connection:
* Board JTAG mode;
* Connect USBII to JTAG port;

Debug in _Vitis
* Click `Launch Target Connections`;
* `connect -url TCP:localhost:3121;connect`
* show all targets:`targets`;
* select the target core: `targets 2`;
* reset core: `rst`;
* Configure FPGA, eg. PL(Program Logics): `fpga *.bit`;
* Make debugger know the memory map: `loadhw *.xsa`;
* download and load ELF/BIN: `dow fsbl.elf`;
* run: `con`, continue;

Other debug operations: set break point; read register; read/write local variable, etc.;


### debug FSBL
Defaultly, no msg output when running fsbl; But it is can be enabled by modify debug macros in _fsbl_debug.h;


## Jump configuration

MicroZed7020, xc7z020clg400-1

jumper  JP1~3. HW manual 28

|QSPI mode | JP3(low)    |JP2/JP1(high)|
|--------------------------------------|
|JTAG mode | JP1-3(high) |             |  
|--------------------------------------|
|SD   mode | JP3/JP2(low)|JP1(high)    |



## References

[xscat debugging guide for zynq700](https://www.xilinx.com/htmldocs/xilinx2018_1/SDK_Doc/xsct/use_cases/xsdb_standalone_app_debug.html)
