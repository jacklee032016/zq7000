############################################################################
# Connect eMMC CD to a constant 0
############################################################################
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND
set_property -dict [list CONFIG.CONST_VAL {0}] [get_bd_cells GND]
connect_bd_net [get_bd_pins GND/dout] [get_bd_pins processing_system7_0/SDIO1_CDN]
