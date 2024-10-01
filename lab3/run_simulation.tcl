# open list_of_files.txt
set fp [open "list_of_files.txt" r]
set files [split [read $fp] "\n"]
close $fp
foreach file $files {
	vlog -sv $file
}
vlog -sv ./tb/tb_alu.sv

vsim work.tb_alu

add wave /*

run -all