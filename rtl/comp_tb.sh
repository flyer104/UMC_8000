echo "comp similat is start"
iverilog -s comp_tb -o tb/comp.vvp tb/comp_tb.v core/datapath.v core/controller.v core/mod/adder.v core/mod/mux.v core/mod/reg.v
vvp tb/comp.vvp
rm tb/comp.vvp