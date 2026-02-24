module RAM_8x16 (
    input clk,
    input rw,
    input [2:0] addr,
    input clr,
    input [15:0] data_in,
    output reg [15:0] data_out
);

    wire [15:0] mem_out [7:0];

    genvar i;
    generate
        for (i=0; i<8; i=i+1) begin : ram_inst
            RAM_1x16 ram (
                .clk(clk),
                .rw(rw & (addr == i)),
                .addr(1'b0),
                .clr(clr),
                .data_in(data_in),
                .data_out(mem_out[i])
            );
        end
    endgenerate

    always @(*) begin
        case (addr)
            3'd0: data_out = mem_out[0];
            3'd1: data_out = mem_out[1];
            3'd2: data_out = mem_out[2];
            3'd3: data_out = mem_out[3];
            3'd4: data_out = mem_out[4];
            3'd5: data_out = mem_out[5];
            3'd6: data_out = mem_out[6];
            3'd7: data_out = mem_out[7];
            default: data_out = 16'bx;
        endcase
    end

endmodule
