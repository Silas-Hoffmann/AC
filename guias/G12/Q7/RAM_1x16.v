module RAM_1x16 (
    input clk,
    input rw,
    input addr,
    input clr,
    input [15:0] data_in,
    output reg [15:0] data_out
);

    reg [15:0] mem;

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            mem <= 16'b0;
        end else if (rw) begin
            mem <= data_in;
        end
    end

    always @(negedge clk) begin
        if (~rw) begin
            data_out <= mem;
        end
    end

endmodule
