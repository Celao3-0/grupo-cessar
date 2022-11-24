module Registers (
    input wire [4:0] readRegister1,
    input wire [4:0] readRegister2,
    input wire [4:0] writeRegister,
    input wire [31:0] writeData,
    input wire regWrite,
    input wire clk,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);
    reg [31:0] register0;
    reg [31:0] register1;
    reg [31:0] register2;
    reg [31:0] register3;
    reg [31:0] register4;
    reg [31:0] register5;
    reg [31:0] register6;
    reg [31:0] register7;
    reg [31:0] register8;
    reg [31:0] register9;
    reg [31:0] register10;
    reg [31:0] register11;
    reg [31:0] register12;
    reg [31:0] register13;
    reg [31:0] register14;
    reg [31:0] register15;
    reg [31:0] register16;
    reg [31:0] register17;
    reg [31:0] register18;
    reg [31:0] register19;
    reg [31:0] register20;
    reg [31:0] register21;
    reg [31:0] register22;
    reg [31:0] register23;
    reg [31:0] register24;
    reg [31:0] register25;
    reg [31:0] register26;
    reg [31:0] register27;
    reg [31:0] register28;
    reg [31:0] register29;
    reg [31:0] register30;
    reg [31:0] register31;

    /* registrador que sempre vale zero na posicao zero, risc-v */
    initial begin
        register0 = 32'd0;
    end

    /* leitura assincrona */
    always @(*) begin
        case (readRegister1)
            4'h0 : register0;
            4'h1 : register1;
            4'h2 : register2;
            4'h3 : register3;
            4'h4 : register4;
            4'h5 : register5;
            4'h6 : register6;
            4'h7 : register7;
            4'h8 : register8;
            4'h9 : register9;
            4'hA : register10;
            4'hB : register11;
            4'hC : register12;
            4'hD : register13;
            4'hE : register14;
            4'hF : register15;
            4'h10: register16;
            4'h11: register17;
            4'h12: register18;
            4'h13: register19;
            4'h14: register20;
            4'h15: register21;
            4'h16: register22;
            4'h17: register23;
            4'h18: register24;
            4'h19: register25;
            4'h1A: register26;
            4'h1B: register27;
            4'h1C: register28;
            4'h1D: register29;
            4'h1E: register30;
            4'h1F: register31;
        endcase

        case (readRegister2)
            4'h0 : readData2 = register0;
            4'h1 : readData2 = register1;
            4'h2 : readData2 = register2;
            4'h3 : readData2 = register3;
            4'h4 : readData2 = register4;
            4'h5 : readData2 = register5;
            4'h6 : readData2 = register6;
            4'h7 : readData2 = register7;
            4'h8 : readData2 = register8;
            4'h9 : readData2 = register9;
            4'hA : readData2 = register10;
            4'hB : readData2 = register11;
            4'hC : readData2 = register12;
            4'hD : readData2 = register13;
            4'hE : readData2 = register14;
            4'hF : readData2 = register15;
            4'h10: readData2 = register16;
            4'h11: readData2 = register17;
            4'h12: readData2 = register18;
            4'h13: readData2 = register19;
            4'h14: readData2 = register20;
            4'h15: readData2 = register21;
            4'h16: readData2 = register22;
            4'h17: readData2 = register23;
            4'h18: readData2 = register24;
            4'h19: readData2 = register25;
            4'h1A: readData2 = register26;
            4'h1B: readData2 = register27;
            4'h1C: readData2 = register28;
            4'h1D: readData2 = register29;
            4'h1E: readData2 = register30;
            4'h1F: readData2 = register31;
        endcase
    end

    /* escrita sincrona */
    always @(posedge clk ) begin
        if (regWrite == 1'b1) begin
           case (writeRegister)
            4'h0 : register0  = writeData;
            4'h1 : register1  = writeData;
            4'h2 : register2  = writeData;
            4'h3 : register3  = writeData;
            4'h4 : register4  = writeData;
            4'h5 : register5  = writeData;
            4'h6 : register6  = writeData;
            4'h7 : register7  = writeData;
            4'h8 : register8  = writeData;
            4'h9 : register9  = writeData;
            4'hA : register10 = writeData;
            4'hB : register11 = writeData;
            4'hC : register12 = writeData;
            4'hD : register13 = writeData;
            4'hE : register14 = writeData;
            4'hF : register15 = writeData;
            4'h10: register16 = writeData;
            4'h11: register17 = writeData;
            4'h12: register18 = writeData;
            4'h13: register19 = writeData;
            4'h14: register20 = writeData;
            4'h15: register21 = writeData;
            4'h16: register22 = writeData;
            4'h17: register23 = writeData;
            4'h18: register24 = writeData;
            4'h19: register25 = writeData;
            4'h1A: register26 = writeData;
            4'h1B: register27 = writeData;
            4'h1C: register28 = writeData;
            4'h1D: register29 = writeData;
            4'h1E: register30 = writeData;
            4'h1F: register31 = writeData;
           endcase 
        end
    end

    
endmodule