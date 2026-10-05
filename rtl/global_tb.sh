echo "global similat is start"
iverilog -s global_tb -o tb/global.vvp tb/global_tb.v core/UMC-8000.v core/datapath.v core/controller.v core/mod/adder.v core/mod/mux.v core/mod/reg.v core/pc.v
vvp tb/global.vvp
rm tb/global.vvp