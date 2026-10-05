module pc (
    input clk,rst,is_end,
    output reg[7:0] pc
);
    reg halt;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            halt <= 1'b0;
            pc   <= 8'b0000_0000;
        end else begin
            if (is_end) begin
                halt <= 1'b1;
            end
            if (!halt && !is_end) begin
                pc <= pc + 1;
            end
        end
    end
endmodule
