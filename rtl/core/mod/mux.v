module demux (
    input wire[7:0] din,
    input wire sel,
    output wire[7:0] dout0,dout1
);
    assign dout0 = sel ? 0 : din;
    assign dout1 = sel ? din : 0;
endmodule

module mux (
    input wire[7:0] din0,din1,
    input wire sel,
    output wire[7:0] dout
);
    assign dout = sel ? din1 : din0;
endmodule