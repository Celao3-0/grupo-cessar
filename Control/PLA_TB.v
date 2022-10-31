`timescale 1ns/100ps
module testbench () ;
    reg [5:0] Op ;
    reg [3:0] CurrentState;

    wire [19:0] out;
    PLA UUT ( .Op( Op ), .CurrentState (CurrentState),  .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .IorD(IorD), .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .MemtoReg(MemtoReg), .PCSource1(PCSource1), .PCSource0(PCSource0), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .ALUSrcB1(ALUSrcB1), .ALUSrcB0(ALUSrcB0), .ALUSrcBA(ALUSrcBA), .RegWrite(RegWrite), .RegDst(RegDst), .NS3(NS3), .NS2(NS2), .NS1(NS1), .NS0(NS0));

    integer i, k, errors;
    task Check ;
        input [0:15] xpect;
        if ({PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst
    } !== xpect) begin
                $display ("Error : Op = %b CurrentState= %b, expect %b, got %b, PCWrite = %b", Op, CurrentState, xpect , {PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst}, PCWrite);
                errors = errors + 1;
        end
    endtask


        initial begin
        errors = 0;
        Op = 6'b000000;

        CurrentState = 4'b0000;
        #10
        Check(16'b1001010000001000);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(16'b000000000011000);
        #10

        CurrentState = 4'b0010;
        #10
        Check(16'b0000000000010100);
        #10

        CurrentState = 4'b0011;
        #10
        Check(16'b0011000000000000);
        #10

        CurrentState = 4'b0100;
        #10
        Check(16'b0000001000000010);
        #10

        CurrentState = 4'b0101;
        #10
        Check(16'b0010100000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(16'b0000000001000100);
        #10

        CurrentState = 4'b0111;
        #10
        Check(16'b0000000000000011);
        #10

        CurrentState = 4'b1000;
        #10
        Check(16'b0100000010100100);
        #10

        CurrentState = 4'b1001;
        #10
        Check(16'b1000000100000000);

        $display (" Test ended , %2d errors ", errors );
    end
endmodule