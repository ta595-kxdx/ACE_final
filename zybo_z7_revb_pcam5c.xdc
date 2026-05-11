
########################################################################
## Zybo Z7-10 Rev B + Digilent Pcam5C (MIPI CSI-2)
## Dedicated MIPI CS Port Constraints
########################################################################

## 125 MHz system clock
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -name sys_clk -period 8.000 [get_ports clk]

## Reset
set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports rst]

########################################################################
## LEDs
########################################################################
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports {led[0]}]
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports {led[1]}]
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports {led[2]}]
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports {led[3]}]
set_property -dict { PACKAGE_PIN G13 IOSTANDARD LVCMOS33 } [get_ports {led[4]}]
set_property -dict { PACKAGE_PIN B16 IOSTANDARD LVCMOS33 } [get_ports {led[5]}]
set_property -dict { PACKAGE_PIN A18 IOSTANDARD LVCMOS33 } [get_ports {led[6]}]
set_property -dict { PACKAGE_PIN K14 IOSTANDARD LVCMOS33 } [get_ports {led[7]}]

########################################################################
## Digilent Joystick PMOD (JA)
########################################################################
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports js_miso]
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports js_mosi]
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports js_sclk]
set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS33 } [get_ports js_cs]

########################################################################
## Digilent Keypad PMOD (JD)
########################################################################
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports {kypd_rows[0]}]
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports {kypd_rows[1]}]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports {kypd_rows[2]}]
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports {kypd_rows[3]}]

set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports {kypd_cols[0]}]
set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 } [get_ports {kypd_cols[1]}]
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports {kypd_cols[2]}]
set_property -dict { PACKAGE_PIN V18 IOSTANDARD LVCMOS33 } [get_ports {kypd_cols[3]}]

########################################################################
## Dedicated MIPI CSI-2 Camera Connector (Rev B)
## Verify against Digilent master XDC before implementation
########################################################################

## Clock lane
set_property PACKAGE_PIN W14 [get_ports mipi_clk_p]
set_property PACKAGE_PIN W13 [get_ports mipi_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_clk_p mipi_clk_n}]

## Data lane 0
set_property PACKAGE_PIN Y14 [get_ports mipi_d0_p]
set_property PACKAGE_PIN Y13 [get_ports mipi_d0_n]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_d0_p mipi_d0_n}]

## Data lane 1
set_property PACKAGE_PIN T12 [get_ports mipi_d1_p]
set_property PACKAGE_PIN T11 [get_ports mipi_d1_n]
set_property IOSTANDARD LVDS_25 [get_ports {mipi_d1_p mipi_d1_n}]

########################################################################
## Camera I2C Control
########################################################################
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 PULLUP true } [get_ports cam_scl]
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 PULLUP true } [get_ports cam_sda]

########################################################################
## Camera reset / powerdown
########################################################################
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports cam_reset]
set_property -dict { PACKAGE_PIN Y17 IOSTANDARD LVCMOS33 } [get_ports cam_pwdn]
