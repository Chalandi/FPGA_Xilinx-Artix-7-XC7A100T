# *****************************************************************************************************************
# Filename    : AlchitryAu+PinMap.xdc
#
# Author      : Chalandi Amine
#
# Owner       : Chalandi Amine
# 
# FPGA board  : AlchitryAu+
#
# Device      : Xilinx Artix-7 XC7A100T FPGA
#
# Date        : 15/10/2022
# 
# Description : Constraint file
# 
# *****************************************************************************************************************

# Global Configuration
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR NO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 1 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]

# LEDs Configuration
set_property PACKAGE_PIN K13 [get_ports {led[0]}]
set_property PACKAGE_PIN K12 [get_ports {led[1]}]
set_property PACKAGE_PIN L14 [get_ports {led[2]}]
set_property PACKAGE_PIN L13 [get_ports {led[3]}]
set_property PACKAGE_PIN M16 [get_ports {led[4]}]
set_property PACKAGE_PIN M14 [get_ports {led[5]}]
set_property PACKAGE_PIN M12 [get_ports {led[6]}]
set_property PACKAGE_PIN N16 [get_ports {led[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

# Seven-Segment Configuration
set_property PACKAGE_PIN P9 [get_ports {AN[3]}]
set_property PACKAGE_PIN N9 [get_ports {AN[2]}]
set_property PACKAGE_PIN R8 [get_ports {AN[1]}]
set_property PACKAGE_PIN P8 [get_ports {AN[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]

set_property PACKAGE_PIN T5  [get_ports {SEG[0]}]
set_property PACKAGE_PIN R5  [get_ports {SEG[1]}]
set_property PACKAGE_PIN T9  [get_ports {SEG[2]}]
set_property PACKAGE_PIN R6  [get_ports {SEG[3]}]
set_property PACKAGE_PIN R7  [get_ports {SEG[4]}]
set_property PACKAGE_PIN T7  [get_ports {SEG[5]}]
set_property PACKAGE_PIN T8  [get_ports {SEG[6]}]
set_property PACKAGE_PIN T10 [get_ports {SEG[7]}]


set_property IOSTANDARD LVCMOS33 [get_ports {SEG[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SEG[7]}]

# LED extention (8 x 3)
set_property PACKAGE_PIN B6 [get_ports {LedEx[0]}]
set_property PACKAGE_PIN B5 [get_ports {LedEx[1]}]
set_property PACKAGE_PIN A5 [get_ports {LedEx[2]}]
set_property PACKAGE_PIN A4 [get_ports {LedEx[3]}]
set_property PACKAGE_PIN B4 [get_ports {LedEx[4]}]
set_property PACKAGE_PIN A3 [get_ports {LedEx[5]}]
set_property PACKAGE_PIN F4 [get_ports {LedEx[6]}]
set_property PACKAGE_PIN F3 [get_ports {LedEx[7]}]
set_property PACKAGE_PIN F2 [get_ports {LedEx[8]}]
set_property PACKAGE_PIN E1 [get_ports {LedEx[9]}]
set_property PACKAGE_PIN B2 [get_ports {LedEx[10]}]
set_property PACKAGE_PIN A2 [get_ports {LedEx[11]}]
set_property PACKAGE_PIN E2 [get_ports {LedEx[12]}]
set_property PACKAGE_PIN D1 [get_ports {LedEx[13]}]
set_property PACKAGE_PIN E6 [get_ports {LedEx[14]}]
set_property PACKAGE_PIN K5 [get_ports {LedEx[15]}]
set_property PACKAGE_PIN G2 [get_ports {LedEx[16]}]
set_property PACKAGE_PIN G1 [get_ports {LedEx[17]}]
set_property PACKAGE_PIN H2 [get_ports {LedEx[18]}]
set_property PACKAGE_PIN H1 [get_ports {LedEx[19]}]
set_property PACKAGE_PIN K1 [get_ports {LedEx[20]}]
set_property PACKAGE_PIN J1 [get_ports {LedEx[21]}]
set_property PACKAGE_PIN L3 [get_ports {LedEx[22]}]
set_property PACKAGE_PIN L2 [get_ports {LedEx[23]}]

set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LedEx[23]}]

# DIP SWITCH Configuration
set_property PACKAGE_PIN C4 [get_ports {DIP[0]}] 
set_property PACKAGE_PIN D4 [get_ports {DIP[1]}] 
set_property PACKAGE_PIN G4 [get_ports {DIP[2]}] 
set_property PACKAGE_PIN G5 [get_ports {DIP[3]}] 
set_property PACKAGE_PIN E5 [get_ports {DIP[4]}] 
set_property PACKAGE_PIN F5 [get_ports {DIP[5]}] 
set_property PACKAGE_PIN D5 [get_ports {DIP[6]}] 
set_property PACKAGE_PIN D6 [get_ports {DIP[7]}] 
set_property PACKAGE_PIN N6 [get_ports {DIP[8]}] 
set_property PACKAGE_PIN M6 [get_ports {DIP[9]}] 
set_property PACKAGE_PIN B1 [get_ports {DIP[10]}]
set_property PACKAGE_PIN C1 [get_ports {DIP[11]}]
set_property PACKAGE_PIN C2 [get_ports {DIP[12]}]
set_property PACKAGE_PIN C3 [get_ports {DIP[13]}]
set_property PACKAGE_PIN D3 [get_ports {DIP[14]}]
set_property PACKAGE_PIN E3 [get_ports {DIP[15]}]
set_property PACKAGE_PIN K2 [get_ports {DIP[16]}]
set_property PACKAGE_PIN K3 [get_ports {DIP[17]}]
set_property PACKAGE_PIN J4 [get_ports {DIP[18]}]
set_property PACKAGE_PIN J5 [get_ports {DIP[19]}]
set_property PACKAGE_PIN H3 [get_ports {DIP[20]}]
set_property PACKAGE_PIN J3 [get_ports {DIP[21]}]
set_property PACKAGE_PIN H4 [get_ports {DIP[22]}]
set_property PACKAGE_PIN H5 [get_ports {DIP[23]}]

set_property IOSTANDARD LVCMOS33 [get_ports {DIP[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {DIP[23]}]

# Switch Configuration
set_property PACKAGE_PIN C6  [get_ports {S[0]}] 
set_property PACKAGE_PIN P11 [get_ports {S[1]}] 
set_property PACKAGE_PIN A7  [get_ports {S[2]}] 
set_property PACKAGE_PIN B7  [get_ports {S[3]}] 
set_property PACKAGE_PIN C7  [get_ports {S[4]}]

set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[4]}]

set_property PULLDOWN true [get_ports {S[0]}]
set_property PULLDOWN true [get_ports {S[1]}]
set_property PULLDOWN true [get_ports {S[2]}]
set_property PULLDOWN true [get_ports {S[3]}]
set_property PULLDOWN true [get_ports {S[4]}]

# Clock configuration
create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_property PACKAGE_PIN N14 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Reset Configuration
set_property PACKAGE_PIN P6 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# serial names are flipped in the schematic (named for the FTDI chip)
set_property PACKAGE_PIN P16 [get_ports {usb_tx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_tx}]

set_property PACKAGE_PIN P15 [get_ports {usb_rx}]
set_property IOSTANDARD LVCMOS33 [get_ports {usb_rx}]

