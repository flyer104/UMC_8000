module register (
    input wire clk,rst,en,
    input wire[7:0] din,
    output reg[7:0] dout
);
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            dout <= 0;
        end else if (en) begin
            dout <= din;
        end else begin
            dout <= dout;
        end
    end
endmodule