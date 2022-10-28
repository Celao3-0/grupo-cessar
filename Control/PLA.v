module moduleName (
    input [5:0] Op,
    input [3:0] CurrentState,

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
    output RegDst,
    output NS3,
    output NS2,
    output NS1,
    output NS0
);
    wire [5:0] OpNegated = ~Op;
    wire [3:0] CurrentStateNegated = ~CurrentState;

    // wires verticais
    wire A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;

    and (A, CurrentStateNegated[0], CurrentStateNegated[1], CurrentStateNegated[2], CurrentStateNegated[3]);
    and (B, CurrentStateNegated[0], CurrentStateNegated[1], CurrentStateNegated[2], CurrentState[3]);
    and (C, CurrentStateNegated[0], CurrentStateNegated[1], CurrentState[2], CurrentStateNegated[3]);
    and (D, CurrentStateNegated[0], CurrentStateNegated[1], CurrentState[2], CurrentState[3]);
    and (E, CurrentStateNegated[0], CurrentState[1], CurrentStateNegated[2], CurrentStateNegated[3]);
    and (F, CurrentStateNegated[0], CurrentState[1], CurrentStateNegated[2], CurrentState[3]);
    and (G, CurrentStateNegated[0], CurrentState[1], CurrentState[2], CurrentStateNegated[3]);
    and (H, CurrentState[0], CurrentStateNegated[1], CurrentStateNegated[2], CurrentStateNegated[3]);
    and (I, CurrentState[0], CurrentStateNegated[1], CurrentStateNegated[2], CurrentStateNegated[3]);
    and (J, CurrentState[0], CurrentStateNegated[1], CurrentStateNegated[2], CurrentStateNegated[3]);
    and (K, B, OpNegated[0], OpNegated[1], OpNegated[2], OpNegated[3], Op[4], OpNegated[5]);
    and (L, B, OpNegated[0], OpNegated[1], OpNegated[2], Op[3], OpNegated[4], OpNegated[5]);
    and (M, B, OpNegated[0], OpNegated[1], OpNegated[2], OpNegated[3], OpNegated[4], OpNegated[5]);
    and (N, C, Op[0], OpNegated[1], Op[2], OpNegated[3], Op[4], Op[5]);
    and (O, B, Op[0], OpNegated[1], OpNegated[2], OpNegated[3], Op[4], Op[5]);
    and (P, B, Op[0], OpNegated[1], Op[2], OpNegated[3], Op[4], Op[5]);
    and (Q, C, Op[0], OpNegated[1], OpNegated[2], OpNegated[3], Op[4], Op[5]);

    or (PCWrite, A, J);
    or (PCWriteCond, H);
    or (IorD, D, F);
    or (MemRead, A, D);
    or (MemWrite, F);
    or (IRWrite, A);
    or (MemtoReg, E);
    or (PCSource1, J);
    or (PCSource0, I);
    or (ALUOp1, G);
    or (ALUOp0, I);
    or (ALUSrcB1, B, C);
    or (ALUSrcB0, A, B);
    or (ALUSrcBA, C, G, I);
    or (RegWrite, E, H);
    or (RegDst, H);
    or (NS3, K, L);
    or (NS2, D, G, M, N);
    or (NS1, G, M, O, P, Q);
    or (NS0, A, G, K, N, Q);
endmodule
