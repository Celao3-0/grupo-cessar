module projeto01(datain, dataout, contro, reset, clk);
    input [31:0] datain;
    input clk, contro, reset;
    output reg [31:0] dataout;
    initial begin
        dataout = 32'd0;
    end
    always @(posedge clk, posedge reset) begin
        if(reset == 1'b1) dataout = 32'd0;
        else begin
            if(contro == 1'b1) dataout = datain;
        end
    end
endmodule