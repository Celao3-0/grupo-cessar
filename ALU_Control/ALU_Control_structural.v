module ALU_Control (
    input ALUOp1,
    input ALUOp0,
    input [5:0] funct,
    output [3:0] operation
);
    wire op2;
    wire op0;

    and (op2, ALUOp1, funct[1]);
    or (op0, funct[0], funct[3]);

    and (operation[3], ALUOp0, ALUOp1);
    or (operation[2], ALUOp0, op2);
    or (operation[1], ~ALUOp1, ~funct[2]);
    and (operation[0], ALUOp1, op0);

endmodule