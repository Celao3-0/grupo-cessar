module immediateG(instruction, immediate);
    input [31:0] instruction;
    output reg [11:0] immediate;
    always @(*) begin
    case (instruction[6:0])
    //BEQ
    7'b1100011:
        immediate[11:0] = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
    //LW
    7'b0000011:
        immediate[11:0] = instruction[31:20];
    //SW
    7'b0100011:
        immediate[11:0] = {instruction[31:25], instruction[11:7]};
    default:
        immediate[11:0] = 7'b0000000;
    endcase
    end
endmodule