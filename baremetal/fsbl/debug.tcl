proc platform_boot_debug_fsbl {args} {
set elf [lindex $args 0]
set bit [lindex $args 1]
set procFilter [lindex $args 2]

puts "FSBL Debug"
puts "Elf: $elf"
puts "Bit: $bit"
puts "ProcFilter: $procFilter"

#Reset system and program fpga	
	targets -set -nocase -filter {name =~ "*APU*"}
rst -system
if {[string trim $bit] != ""} {
    fpga -file $bit 
}

#Download elf
targets -set -nocase -filter {name =~ "$procFilter"}
rst -processor
dow $elf
set bpId [bpadd -addr &main]	
con -block
bpremove $bpId		

}
