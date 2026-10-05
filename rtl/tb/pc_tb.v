`timescale 1ns/1ps

module pc_tb ();
    reg clk,rst,is_end;
    wire[7:0] pc;

    initial is_end = 0;
    initial rst = 1;
    initial clk = 0;
    always #5 clk = ~clk;

    pc upc(
        .clk (clk),
        .rst (rst),
        .is_end (is_end),
        .pc (pc)
    );

    initial begin
        $dumpfile("tb/vcd/pc_tb.vcd");
        $dumpvars(0 , pc_tb);
        #10
        rst = 0;
        #5
        rst = 1;
        #100
        is_end = 1;
        #10
        is_end = 0;
        #20
        $display("pc similation is over-----------------");
        $finish;
    end
endmodule