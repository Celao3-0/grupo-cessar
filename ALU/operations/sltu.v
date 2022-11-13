module sltu (
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] result
);
    // nao complemento de 2
    always @(*) begin
        result <= A < B ? 1:0;
    end
endmodule