`timescale 1ns/1ps

module controller_tb ();
    reg[7:0] instru;
    wire mem_in,sum_en,sum_in,sum_out,is_end,mem_write;
    wire[5:0] mem_addr;

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

    initial begin
        $dumpfile("tb/vcd/controller_tb.vcd");
        $dumpvars(0 , controller_tb);
        #10
        instru = 'h00;
        #10
        instru = 'h03;
        #10
        instru = 'h06;
        #10
        instru = 'h0d;
        #10
        $display("controller similation is over-----------------");
        $finish;
    end
endmodule