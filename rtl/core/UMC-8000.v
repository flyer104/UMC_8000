//   _   _ __  __  ____       ___   ___   ___   ___  
//  | | | |  \/  |/ ___|     ( _ ) / _ \ / _ \ / _ \ 
//  | | | | |\/| | |   _____ / _ \| | | | | | | | | |
//  | |_| | |  | | |__|_____| (_) | |_| | |_| | |_| |
//   \___/|_|  |_|\____|     \___/ \___/ \___/ \___/ 
// 
module UMC_8000 (
    input wire clk,rst,
    input wire[7:0] mem_rdata,instru,
    output wire[7:0] mem_wdata,pc,
    output wire[5:0] mem_addr,
    output wire mem_write
);
    //datapath-------------------------------------------------
    wire mem_in,sum_in,sum_out,sum_en;

    datapath u_datapath(
        .mem_in (mem_in),
        .sum_in (sum_in),
        .sum_out (sum_out),
        .sum_en (sum_en),
        .clk (clk),
        .rst (rst),
        .mem_rdata (mem_rdata),
        .mem_wdata (mem_wdata)
    );

    //controller-----------------------------------------------
    wire is_end;

    controller u_controller(
        .mem_in (mem_in),
        .sum_in (sum_in),
        .sum_out (sum_out),
        .sum_en (sum_en),
        .is_end (is_end),
        .instru (instru),
        .mem_addr (mem_addr),
        .mem_write (mem_write)
    );

    //pc-------------------------------------------------------
    pc u_pc(
        .clk (clk),
        .rst (rst),
        .pc (pc),
        .is_end (is_end)
    );
endmodule