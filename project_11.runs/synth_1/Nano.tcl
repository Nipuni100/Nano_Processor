# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Downloads/Lab10/project_11/project_11.cache/wt [current_project]
set_property parent.project_path D:/Downloads/Lab10/project_11/project_11.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.2 [current_project]
set_property ip_output_repo d:/Downloads/Lab10/project_11/project_11.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/Adder_Subtractor_2.vhd
  {D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/Lab 5  _ new 1/Lab 5.srcs/sources_1/new/D_FF.vhd}
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/new/Decoder_2_to_4.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/new/Decoder_3_to_8.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/new/FA.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/new/HA.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/Instruction_Decoder.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/Lab7_new/Lab7_new.srcs/sources_1/new/LUT_16_7.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/nanoprocessor/2way3bitMUX/Way2_bit3_MUX/Way2_bit3_MUX.srcs/sources_1/new/MUX_2to1.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/Lab_4_new1/Lab_4.srcs/sources_1/new/Mux_8_to_1.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/new/Program_Counter.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/RCA_3.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/nanoprocessor/Program_ROM/Program_ROM.srcs/sources_1/new/ROM.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/Register_4_bit.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/Register_Bank.vhd
  {D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/Lab 5  _ new 1/Lab 5.srcs/sources_1/new/Slow_Clk.vhd}
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/nanoprocessor/2way3bitMUX/Way2_bit3_MUX/Way2_bit3_MUX.srcs/sources_1/new/Way2_3_Mux.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/nanoprocessor/2Way_4bit_MUX/2Way_4bit_MUX.srcs/sources_1/new/Way2_4bit_MUX.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/imports/DELL/nanoprocessor/Way_8_4bit_Mux/Way_8_4bit_Mux.srcs/sources_1/new/Way8_4_MUX.vhd
  D:/Downloads/Lab10/project_11/project_11.srcs/sources_1/new/Nano.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Downloads/Lab10/project_11/project_11.srcs/constrs_1/imports/computer organization/Basys3Labs.xdc}}
set_property used_in_implementation false [get_files {{D:/Downloads/Lab10/project_11/project_11.srcs/constrs_1/imports/computer organization/Basys3Labs.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Nano -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Nano.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Nano_utilization_synth.rpt -pb Nano_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
