module slt (
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] result
);
    // complemento de 2

    always @(*) begin
        case (A[31])
            1'b1: case (B[31])
                1'b1: result <= A < B && A != B ? 0:1;
                default: result <= 1; 
            endcase
            default: case (B[31])
                1'b1: result <= 0;
                default: result <= A < B ? 1:0;
            endcase
        endcase
    end
endmodule