module ALU (
    input [0:5] aluOperation,
    input [0:31] x,
    input [0:31] y,
    output [0:31] out,
    output zr,
    output ng
);

/*

        DECLARACAO DOS PARANAUES

*/
    /* wires sao inputs */
    /* o signed eh para ser complemento de 2
       eu acho */
    wire [0:5] aluOperation;
    wire signed [0:31] x, y;

    /* regs sao outputs */
    reg signed [0:31] out;
    reg zr, ng;

    /* ISSO AQUI É UMA BRISA MEU NOBRE */
    reg signed [0:31] x_signed, y_signed;
    reg signed zr_1, ng_1;
    reg signed [0:31] out_signed;

    

/* LOGICA */
    always @(*)
        /* begin
            case(aluOperation)
                4'b0000: out = x & y;  
                4'b0001: out = x | y;
                4'b0010: out = x + y;
                4'b0011: out = x - y;
            endcase;
         end; */

        /* zx nx zy ny f no */

        /* Inverte e zera */
        begin
            x_signed = x;
            y_signed = y;


            case(aluOperation[0])
                1'b1: x_signed = 32'b00000000000000000000000000000000;
            endcase;

            case(aluOperation[1])
                1'b1: x_signed = ~x_signed;
            endcase;

            case(aluOperation[2])
                1'b1: y_signed = 32'b00000000000000000000000000000000;
            endcase;

            case(aluOperation[3])
                1'b1: y_signed = ~y_signed;
            endcase;
            
             /* Soma ou dah and */
            out_signed = 32'b00000000000000000000000000000000;
            case(aluOperation[4])
                1'b1: out_signed = y_signed + x_signed;
                1'b0: out_signed = y_signed & x_signed;
            endcase;

            /* inverte ou nao output */
            case(aluOperation[5])
                1'b1: out_signed = ~out_signed;
            endcase;
            out = out_signed;

            /* seta outros outputs */
            /* se eh zero */
            zr_1 = 1'b0;
            case(out_signed)
                32'b00000000000000000000000000000000: zr_1 = 1'b1;
            endcase;
            zr = zr_1;

            /* se eh negativo */
            ng_1 = 1'b0;
            case(out[0])
                1'b1: ng_1 = 1'b1;
            endcase;
            ng = ng_1;
        end;
endmodule
