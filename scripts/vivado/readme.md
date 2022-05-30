# README for Vivado script

Script to create vivado project for MicroZed 7020 board

## How to

Enter into `Vivado TCL shell`:

```
cd c:/zq7/proj
source main.tcl
```


```
close_project
```
and try again


##

main.tcl --> zq7_cfg_bd.tcl --> MicroZed_PS_properties.tcl

Mainly modify zq7_cfg_bd.tcl for different designs.

exampleProj.tcl: an example tcl file which creating an vivado project.


## References

refere to main.tcl and config_bd.tcl in 'hardware/xilinx-zc702-2022.1' of [xilinx-zc702-2022.1 BSP] 
(https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html)

[vivado tcl guide] (https://docs.xilinx.com/v/u/2019.1-English/ug894-vivado-tcl-scripting)
