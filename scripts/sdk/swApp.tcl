
# config items
set HW_XSA {zq7First.xsa}
set PLAT_NAME firstPt
set APP_NAME firstApp

set OUTPUT_FOLDER $PLAT_NAME

file mkdir $OUTPUT_FOLDER
setws -switch ./${OUTPUT_FOLDER}

puts "hw: ${HW_XSA}"
platform create -name ${PLAT_NAME}\
    -hw ${HW_XSA} \
    -proc {ps7_cortexa9_0} -os {standalone} -out ${OUTPUT_FOLDER}

puts "active platform: [platform active]"

# Writes platform to platform.spr file
platform write

# Build the active platform and add it to the repository; must be selected as active platform before building
# all the domains that are part of the plafform are built
# domain list -dict
# zynq_fsbl {processor ps7_cortexa9_0 os standalone} standalone_domain {processor ps7_cortexa9_0 os standalone}
platform generate -domains 
platform active ${PLAT_NAME}
puts "active platform: [platform active]; extra flags: '[platform config -extra-compiler-flags fsbl]'"
#platform config -extra-compiler-flags fsbl "-DFSBL_DEBUG_INFO [platform config -extra-compiler-flags fsbl] "
platform generate


# Create an application using an existing platform and domain, and add it to a system project
# If <system-project> is not specified, then a system project is created with name appname_system
app create -name ${APP_NAME} -platform ${PLAT_NAME} 
# -domain <domain> -sysproj <system-project> 
app config -name ${APP_NAME} define-compiler-symbols FSBL_DEBUG_INFO

app build -name ${APP_NAME}


puts "Build boot image now..."

set outputFile [open ${OUTPUT_FOLDER}/${PLAT_NAME}.bif w+]

# .bif file content
puts $outputFile "/* /bootgen_zynq_fsbl_system/sd_card_temp/boot.bif */ "
puts $outputFile "/* Command to create bitstream .bin file:       */"
puts $outputFile "/*   bootgen -image <bif_file> -split bin -w    */"
puts $outputFile "/* Command to create BOOT.BIN file:             */"
puts $outputFile "/*   bootgen  -image <bif_file> -w -o i BOOT.BIN */"
puts $outputFile "/*zc702*/"
puts $outputFile "the_ROM_image:"
puts $outputFile "{"
puts $outputFile "\[bootloader] ./${OUTPUT_FOLDER}/${PLAT_NAME}/export/${PLAT_NAME}/sw/${PLAT_NAME}/boot/fsbl.elf"
puts $outputFile "./${OUTPUT_FOLDER}/${APP_NAME}/Debug/${APP_NAME}.elf"
puts $outputFile "}"
close $outputFile
#boot.bin file create
exec bootgen -arch zynq -image ${OUTPUT_FOLDER}/${PLAT_NAME}.bif -w -o ${OUTPUT_FOLDER}/BOOT.bin
