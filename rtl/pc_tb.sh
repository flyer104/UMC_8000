echo "start to similat , see tb/pc.vcd"
iverilog -s pc_tb -o tb/pc.vvp tb/pc_tb.v core/pc.v
vvp tb/pc.vvp
rm tb/pc.vvp