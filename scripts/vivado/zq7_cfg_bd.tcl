
# define proc
proc create_project_1 { parentCell nameHier } {

    set parentObj [get_bd_cells $parentCell]

    set oldCurInst [current_bd_instance .]

    current_bd_instance $parentObj

    if {$nameHier ne "" } {
        set hier_obj [create_bd_cell -type hier $nameHier]
        current_bd_instance $hier_obj
    }
    # set leds_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 leds_4bits ] 

    # add block of PS7, name it as zynqps_0
    set ::PS_INST zynqps_0
    set zynqps_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 zynqps_0 ]

    #apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 -config {make_external "FIXED_IO, DDR" apply_board_preset "1" Master "Disable" Slave "Disable"} [get_bd_cells zynqps_0]
    #PCW of MicroZed board: FIXED_IO, DDR and MIO, etc.
    source ./MicroZed_PS_properties.tcl

    #set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_0 ]
    #set_property -dict [ list \
    #    CONFIG.C_ALL_OUTPUTS {1} \
    #    CONFIG.C_GPIO_WIDTH {4} \
    #] $axi_gpio_0 

    # create cell of proc_sys_reset
    set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_0 ]
    
    # 
    #set smartcon_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect smartcon_0 ]
    #set_property -dict [ list \
    #    CONFIG.NUM_CLKS {1} \
    #    CONFIG.NUM_MI {1} \
    #    CONFIG.NUM_SI {1} \
    #] $smartcon_0 


    # FCLK of ps7 to AXI_GP0_ACLK of ps7
    # connect_bd_net -net zynqps_0_FCLK_CLK0_zynqps_0_M_AXI_GP0_ACLK [get_bd_pins zynqps_0/FCLK_CLK0] [get_bd_pins zynqps_0/M_AXI_GP0_ACLK]
    
    connect_bd_net -net zynqps_0_FCLK_RESET0_N_proc_sys_reset_0_ext_reset_in [get_bd_pins zynqps_0/FCLK_RESET0_N] [get_bd_pins proc_sys_reset_0/ext_reset_in]
    
    #
    #connect_bd_intf_net -intf_net zynqps_0_M_AXI_GP0_smartcon_0_S00_AXI [get_bd_intf_pins zynqps_0/M_AXI_GP0] [get_bd_intf_pins smartcon_0/S00_AXI]
    #connect_bd_intf_net -intf_net axi_gpio_0_GPIO_intf_port_0_leds_4bits [get_bd_intf_pins axi_gpio_0/GPIO] [get_bd_intf_ports leds_4bits]
    #connect_bd_net -net proc_sys_reset_0_peripheral_aresetn_axi_gpio_0_s_axi_aresetn [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn]
    #connect_bd_net -net proc_sys_reset_0_interconnect_aresetn_smartcon_0_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartcon_0/aresetn]
    #connect_bd_intf_net -intf_net smartcon_0_M00_AXI_axi_gpio_0_S_AXI [get_bd_intf_pins smartcon_0/M00_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
    
    #connect_bd_net [get_bd_pins zynqps_0/FCLK_CLK0] [get_bd_pins axi_gpio_0/s_axi_aclk]
    
    #
    connect_bd_net [get_bd_pins zynqps_0/FCLK_CLK0] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
    #connect_bd_net [get_bd_pins zynqps_0/FCLK_CLK0] [get_bd_pins smartcon_0/aclk]

    current_bd_instance $oldCurInst

}
create_project_1 "" ""

