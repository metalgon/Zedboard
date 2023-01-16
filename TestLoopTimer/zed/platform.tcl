# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\00.work\03.Zynq\00.work\00.zedboard\TestLoopTimer\zed\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\00.work\03.Zynq\00.work\00.zedboard\TestLoopTimer\zed\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zed}\
-hw {C:\Xilinx\Vitis\2022.2\data\embeddedsw\lib\fixed_hwplatforms\zed.xsa}\
-out {E:/00.work/03.Zynq/00.work/00.zedboard/TestLoopTimer}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {lwip_echo_server}
platform generate -domains 
platform active {zed}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp config lwip_dhcp "false"
bsp write
bsp reload
catch {bsp regenerate}
platform clean
bsp reload
bsp config lwip_dhcp "true"
bsp write
bsp reload
catch {bsp regenerate}
platform clean
platform generate
bsp config dhcp_does_arp_check "true"
bsp config lwip_dhcp "false"
bsp write
bsp reload
catch {bsp regenerate}
bsp config dhcp_does_arp_check "false"
bsp write
bsp reload
catch {bsp regenerate}
platform generate
platform clean
platform generate
platform clean
platform generate
platform generate -domains standalone_ps7_cortexa9_0 
platform generate -domains standalone_ps7_cortexa9_0 
platform generate -domains standalone_ps7_cortexa9_0 
platform generate -domains standalone_ps7_cortexa9_0 
platform clean
platform generate
platform clean
platform generate
