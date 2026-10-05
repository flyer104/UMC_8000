`timescale 1ns/1ps

module comp_tb ();
    reg clk,rst;
    reg[7:0] instru,mem_rdata;
    wire is_end,mem_write,mem_in,sum_en,sum_in,sum_out;
    wire[5:0] mem_addr;
    wire[7:0] mem_wdata;

    controller controller(
        .mem_in (mem_in),
        .sum_en (sum_en),
        .sum_in (sum_in),
        .sum_out (sum_out),
        .is_end (is_end),
        .mem_write (mem_write),
        .instru (instru),
        .mem_addr (mem_addr)
    );

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

    initial rst = 1;
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb/vcd/comp_tb.vcd");
        $dumpvars(0 , comp_tb);
        #5
        rst = 0;
        #5
        rst = 1;
        instru = 'h00;
        mem_rdata = 1;
        #10
        instru = 'h06;
        #10
        instru = 'h0d;
        mem_rdata = 0;
        #10
        instru = 'h03;
        #20
        $display("comp similation is over-----------------");
        $finish;
    end
endmodule