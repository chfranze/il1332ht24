# open list_of_files.txt
set fp [open "list_of_files.txt" r]
set files [split [read $fp] "\n"]
close $fp
foreach file $files {
	vlog -sv $file
}
vlog -sv ./tb/mult_mnbit_tb.sv

vsim work.mult_mnbit_tb

add wave /*

run -all