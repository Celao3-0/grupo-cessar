module ALU_Control (
    input [1:0] ALUOp,
    input [5:0] funct,
    output [3:0] operation
);
    reg [3:0] op;
    always @(*)
        begin
            case (ALUOp[1])
                1'b0:
                    case (ALUOp[0])
                        1'b0: op = 4'b0010;
                        default: op = 4'b0110;
                    endcase
                default:
                    case (ALUOp[0])
                        1'b1: op = 4'b0110;
                        default: 
                            case (funct[0])
                                1'b1: op = 4'b0001;
                                default:
                                    case (funct[1])
                                        1'b1: 
                                            case (funct[3])
                                                1'b1: op = 4'b0111;
                                                default: op = 4'b0110;
                                            endcase
                                        default: 
                                            case (funct[2])
                                                1'b0: op = 4'b0010; 
                                                default: op = 4'b0000;
                                            endcase
                                    endcase
                            endcase
                    endcase
            endcase
        end
        assign operation = op;

endmodule