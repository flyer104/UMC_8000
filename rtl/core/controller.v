module controller (
    input wire[7:0] instru,
    output wire[5:0] mem_addr,
    output wire is_end,mem_in,sum_en,sum_in,sum_out,mem_write
);
    reg[5:0] code;
    wire[1:0] opcode;

    assign {is_end,mem_in,sum_en,sum_in,sum_out,mem_write} = code;
    assign mem_addr = instru[7:2];
    assign opcode = instru[1:0];

    always @(*) begin
        case (opcode)
            2'b00 : code <= 6'b0_0_1_0_0_0;
            2'b01 : code <= 6'b0_0_0_0_1_1;
            2'b10 : code <= 6'b0_1_1_1_0_0;
            2'b11 : code <= 6'b1_0_0_0_0_0;
        endcase
    end
endmodule