create_bd_design "pcam5c_design"
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 processing_system7_0
create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem mipi_csi2_rx_subsystem_0
create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_iic_0
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_0

set_property -dict [list CONFIG.CMN_NUM_LANES {2}] [get_bd_cells mipi_csi2_rx_subsystem_0]
validate_bd_design
save_bd_design
