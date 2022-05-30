

# 
# No.1: Create Project
#

#Create output directory and clear contents
set PROJECT_NAME example

set OUTPUT_DIR ./$PROJECT_NAME


file mkdir $OUTPUT_DIR
set files [glob -nocomplain "$OUTPUT_DIR/*"]
if {[llength $files] != 0} {
    puts "deleting contents of $OUTPUT_DIR"
    file delete -force {*}[glob -directory $OUTPUT_DIR *]; # clear folder contents
} else {
    puts "output folder: '$OUTPUT_DIR' is empty"
}


# same effect for following 2 options
#set PROJECT_BOARD [get_board_parts "*:microzed_7020:*" -latest_file_version]
#set BOARD_PART [get_property PART_NAME [get_board_parts $PROJECT_BOARD]]

set PROJECT_BOARD "em.avnet.com:microzed_7020:part0:1.0"
set BOARD_PART "xc7z020clg400-1"


puts "PROJECT_BOARD:'$PROJECT_BOARD'"
puts "BOARD_PART:[get_property PART_NAME [get_board_parts $PROJECT_BOARD]]"

# first is project name, the second is output folder for this project, otherwise, current working folder;
create_project -force -part $BOARD_PART $PROJECT_NAME $OUTPUT_DIR
set_property board_part $PROJECT_BOARD [current_project]



# 
# No.2: add or import files( import_files)
#


#add source files to Vivado project
# three filesets created by default: sources, constrs_1, and sim_1
#add_files -fileset sim_1 ./path/to/testbench.vhd
# glob command returns all of the files within the specified file path matching the file pattern
#add_files [glob ./path/to/sources/*.vhd]
#add_files -fileset constrs_1 ./path/to/constraint/constraint.xdc

#add_files [glob ./path/to/library/sources/*.vhd]
# defines the library the files should reference. Note: you must add the files to the project before setting the library parameter
#set_property -library userDefined [glob ./path/to/library/sources/*.vhd]



# 
# No.3: set top module
#

#set top level module and update compile order
#set_property top nameOfTopModule [current_fileset]
#update_compile_order -fileset sources_1
#update_compile_order -fileset sim_1


# 
# No.4: launch synthesis
#

#launch synthesis
launch_runs synth_1
wait_on_run synth_1


# 
# No.5: Generate Bitstream
#

#Run implementation and generate bitstream
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
puts "Implementation done!"
