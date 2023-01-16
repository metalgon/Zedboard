# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\00.work\03.Zynq\00.work\00.zedboard\TestLoopTimer\testApp_system\_ide\scripts\debugger_testapp-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\00.work\03.Zynq\00.work\00.zedboard\TestLoopTimer\testApp_system\_ide\scripts\debugger_testapp-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/00.work/03.Zynq/00.work/00.zedboard/TestLoopTimer/zed/export/zed/hw/zed.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source E:/00.work/03.Zynq/00.work/00.zedboard/TestLoopTimer/testApp/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/00.work/03.Zynq/00.work/00.zedboard/TestLoopTimer/testApp/Debug/testApp.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
