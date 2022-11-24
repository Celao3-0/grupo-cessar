module InstructionMemory(
    input [31:0] PC,
    output [31:0] instruction
);
    reg [31:0] Memory [31:0];

    integer i;

    initial begin
        // setar 0 sub
        Memory[0] = 32'b01000000000000000000000000110011;
        // load word
        Memory[1] = 32'b00000000000000000010000010000011;
        //beq
        Memory[2] = 32'b00000000000000000000000001100011;
        for (i = 3; i < 32; i = i + 1) begin
            Memory[i] = 32'b0;
        end
    end
    
    assign instruction = Memory[PC];

    
endmodule