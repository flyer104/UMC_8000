`timescale 1ns/1ps

module datapath_tb ();
    reg mem_in,sum_in,sum_out,sum_en,clk,rst;
    reg[7:0] mem_rdata;
    wire[7:0] mem_wdata;

    datapath datapath(
        .mem_in (mem_in),
        .sum_in (sum_in),
        .sum_out (sum_out),
        .sum_en (sum_en),
        .clk (clk),
        .rst (rst),
        .mem_rdata (mem_rdata),
        .mem_wdata (mem_wdata)
    );

    initial mem_in = 0;
    initial sum_in = 0;
    initial sum_out = 0;
    initial sum_en = 0;
    initial rst = 1;
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb/vcd/datapath_tb.vcd");
        $dumpvars(0 , datapath_tb);
        #10
        rst = 0;
        #5
        rst = 1;
        #5
        mem_rdata = 1;
        sum_en = 1;
        #10
        mem_rdata = 1;
        sum_in = 1;
        mem_in = 1;
        #10
        mem_in = 0;
        sum_in = 0;
        sum_en = 0;
        sum_out = 1;
        #10
        sum_out = 0;
        mem_rdata = 0;
        #10
        $display("datapath similation is over-----------------");
        $finish;
    end
endmodule