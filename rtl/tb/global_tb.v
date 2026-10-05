`timescale 1ns/1ps

module global_tb ();
    reg clk,rst;
    wire[7:0] instru,mem_rdata;
    wire[5:0] mem_addr;
    wire[7:0] mem_wdata,pc;
    wire mem_write;

    UMC_8000 UMC_8000(
        .clk (clk),
        .rst (rst),
        .pc (pc),
        .instru (instru),
        .mem_write (mem_write),
        .mem_addr (mem_addr),
        .mem_rdata (mem_rdata),
        .mem_wdata (mem_wdata)
    );

    ram ram(
        .addr (mem_addr),
        .wdata (mem_wdata),
        .clk (clk),
        .mem_write (mem_write),
        .rdata (mem_rdata)
    );

    instru_rom rom(
        .pc (pc),
        .instru (instru)
    );

    initial rst = 1;
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb/vcd/global_tb.vcd");
        $dumpvars(0 , global_tb);
        #10
        rst = 0;
        #5
        rst = 1;
        #105
        $display("global similation is over-----------------");
        $finish;
    end
endmodule

module ram (
    input wire[5:0] addr,
    input wire[7:0] wdata,
    input wire clk,mem_write,
    output wire[7:0] rdata
);
    reg[7:0] ram[0:63];

    assign rdata = ram[addr];

    always @(posedge clk) begin
        if (mem_write) begin
            ram[addr] <= wdata;
        end
    end

    initial begin
        ram[0] <= 1;
        ram[1] <= 1;
    end
endmodule

module instru_rom (
    input wire[7:0] pc,
    output wire[7:0] instru
);
    reg[7:0] rom[0:255];

    assign instru = rom[pc];

    initial begin
        rom[0] <= 'h00;
        rom[1] <= 'h06;
        rom[2] <= 'h0d;
        rom[3] <= 'h03;
    end
endmodule