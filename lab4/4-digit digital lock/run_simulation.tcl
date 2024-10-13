# open list_of_files.txt
set fp [open "list_of_files.txt" r]
set files [split [read $fp] "\n"]
close $fp
foreach file $files {
	vlog -sv $file
}
vlog -sv ./tb/tb_digital_lock.sv

vsim work.tb_digital_lock

add wave /*

add wave -position end  sim:/tb_digital_lock/uut/unlock_pin
add wave -position end  sim:/tb_digital_lock/uut/entered_pin
add wave -position end  sim:/tb_digital_lock/uut/pin_digit_count

run -all