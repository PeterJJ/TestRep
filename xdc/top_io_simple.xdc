# User Generated IO constraints 
set_property IOSTANDARD LVCMOS25 [get_ports clk]
set_property IOSTANDARD LVCMOS25 [get_ports in]
set_property IOSTANDARD LVCMOS25 [get_ports out]

# User Generated physical constraints 
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]

set_property PACKAGE_PIN AE23 [get_ports clk]
set_property PACKAGE_PIN AE20 [get_ports in]
set_property PACKAGE_PIN AK21 [get_ports out]
