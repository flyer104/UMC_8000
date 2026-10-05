module datapath (
    input wire clk,rst,mem_in,sum_in,sum_out,sum_en,
    input wire[7:0] mem_rdata,
    output wire[7:0] mem_wdata
);
    wire[7:0] mem_to_adder,mem_to_sum;
    wire[7:0] adder_to_sum;
    wire[7:0] sum_input,sum_output;
    wire[7:0] sum_to_adder;

    demux mem_in_demux(
        .sel (mem_in),
        .din (mem_rdata),
        .dout0 (mem_to_sum),
        .dout1 (mem_to_adder)
    );

    mux sum_in_mux(
        .sel (sum_in),
        .din0 (mem_to_sum),
        .din1 (adder_to_sum),
        .dout (sum_input)
    );

    register sum(
        .clk (clk),
        .rst (rst),
        .en (sum_en),
        .din (sum_input),
        .dout (sum_output)
    );

    demux sum_out_demux(
        .sel (sum_out),
        .din (sum_output),
        .dout0 (sum_to_adder),
        .dout1 (mem_wdata)
    );

    adder adder(
        .a1 (mem_to_adder),
        .a2 (sum_to_adder),
        .out (adder_to_sum)
    );
endmodule