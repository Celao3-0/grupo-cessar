`include "FlipFlopD.v"
`include "PLA.v"

module ControUnit (
    input [31:0] instruction,
    input clock,
    output PCWrite,
    output PCWriteCond,
    output IorD,
    output MemRead,
    output MemWrite,
    output IRWrite,
    output MemtoReg,
    output PCSource1,
    output PCSource0,
    output ALUOp1,
    output ALUOp0,
    output ALUSrcB1,
    output ALUSrcB0,
    output ALUSrcBA,
    output RegWrite,
    output RegDst
);
    wire ns3;
    wire ns2;
    wire ns1;
    wire ns0;

    wire s3;
    wire s2;
    wire s1;
    wire s0;

    wire s3bar;
    wire s2bar;
    wire s1bar;
    wire s0bar;

    flipflopD flfp3 (clock, ns3, s3, s3bar);
    flipflopD flfp2 (clock, ns2, s2, s2bar);
    flipflopD flfp1 (clock, ns1, s1, s1bar);
    flipflopD flfp0 (clock, ns0, s0, s0bar);

    PLA plaModule ({instruction[0], instruction[1],
                    instruction[2], instruction[3],
                    instruction[4], instruction[5]},
                    {s3, s2, s1, s0},
                    PCWrite,
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
                    RegDst,
                    ns3, ns2, ns1, ns0
                   );
endmodule