`timescale 1ns/100ps
module testbench () ;
    reg ALUOp1;
    reg ALUOp0;
    reg [5:0] funct;

    wire [3:0] operation;

    integer i, k, errors;
    task Check ;
        input [3:0] xpect;
        if (operation !== xpect && (funct[3:0] == 4'b0000 || funct[3:0] == 4'b0010 || funct[3:0] == 4'b0100 || funct[3:0] == 4'b0100 || funct[3:0] == 4'b0101 || funct[3:0] == 4'b1010)) begin
                $display (" Error : ALUOp = %b funct = %b, expect %b, got %b", {ALUOp1, ALUOp0}, funct, xpect , operation );
                errors = errors + 1;
        end
    endtask

    ALU_Control UUT (.ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .funct (funct), .operation(operation));

        initial begin
        errors = 0;
        ALUOp1 = 1'b0;
        ALUOp0 = 1'b0;

        #10;
        for (i = 0; i <= 63; i = i + 1) begin
            #10;
            funct = i;
            #10;
            Check(4'b0010);
        end

        ALUOp1 = 1'b0;
        ALUOp0 = 1'b1;
        for (i = 0; i <= 63; i = i + 1) begin
            #10;
            funct = i;
            #10;
            Check(4'b0110);
        end

        ALUOp1 = 1'b1;
        ALUOp0 = 1'b0;
        for (i = 0; i <= 63; i = i + 1) begin
            #10;
            funct = i;
            #10;
            case (funct[0])
                1'b1: Check(4'b0001);
                default:
                    case (funct[1])
                        1'b1: begin
                            case (funct[3])
                                1'b1: Check(4'b0111); 
                                default: Check(4'b0110);
                            endcase
                        end
                        default: begin
                            case (funct[2])
                                1'b0: Check(4'b0010); 
                                default: Check(4'b0000);
                            endcase
                        end
                    endcase
            endcase
        end
        $display (" Test ended , %2d errors ", errors );
    end
endmodule