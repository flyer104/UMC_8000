echo "controller similat is start"
iverilog -s controller_tb -o tb/controller.vvp tb/controller_tb.v core/controller.v
vvp tb/controller.vvp
rm tb/controller.vvp