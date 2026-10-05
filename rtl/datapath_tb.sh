echo "datapath similat is start"
iverilog -s datapath_tb -o tb/datapath.vvp tb/datapath_tb.v core/datapath.v core/mod/reg.v core/mod/adder.v core/mod/mux.v
vvp tb/datapath.vvp
rm tb/datapath.vvp