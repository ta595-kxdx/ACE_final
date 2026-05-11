
create_project pcam5c_mipi ./pcam5c_mipi -part xc7z010clg400-1

create_bd_design "design_1"

startgroup
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 processing_system7_0
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
-config {make_external "FIXED_IO, DDR"} [get_bd_cells processing_system7_0]
endgroup

create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz clk_wiz_0

create_bd_cell -type ip -vlnv xilinx.com:ip:mipi_csi2_rx_subsystem mipi_csi2_rx_subsyst_0

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic axi_iic_0

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio axi_gpio_0

create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset proc_sys_reset_0

connect_bd_net [get_bd_pins processing_system7_0/FCLK_CLK0] \
[get_bd_pins clk_wiz_0/clk_in1]

connect_bd_net [get_bd_pins processing_system7_0/FCLK_RESET0_N] \
[get_bd_pins proc_sys_reset_0/ext_reset_in]

connect_bd_intf_net \
[get_bd_intf_pins processing_system7_0/M_AXI_GP0] \
[get_bd_intf_pins axi_iic_0/S_AXI]

assign_bd_address

save_bd_design
