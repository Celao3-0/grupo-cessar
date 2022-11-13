`timescale 1ns / 100 ps
module testimmG();
    reg [31:0]instruction_tb;
    wire [11:0] immediate_tb;
    immediateG uut (.instruction(instruction_tb),.immediate(immediate_tb));


    initial begin
        //CASO DEFAULT 
        instruction_tb = 32'b11111111111111111111111110000000;
        #20
        $display("CASO DEFAULT");
        $display("Immediate = %b\n", immediate_tb);
        if(immediate_tb == 12'b000000000000)
        $display("Ta OK\n");
        else
        $display("Nao Ta OK");
        #20

        //BEQ
        instruction_tb = 32'b00001111111111111111111101100011;
        #20
        $display ("CASO BEQ");
        $display("Immediate = %b\n", immediate_tb);
        if(immediate_tb == 12'b000001111111)
            $display("Ta OK\n");
        else
            $display("Nao Ta OK");

        //LW
        instruction_tb = 32'b01010101010101111111111110000011;
        #20
        $display("CASO LW");
        $display("Immediate = %b\n", immediate_tb);
        if(immediate_tb == 12'b010101010101)
            $display("Ta OK\n");
        else
            $display("Nao Ta OK");

        //SW
        instruction_tb = 32'01010101111111111111101010100011;
        #20
        $display("CASO SW");
        $display("Immediate = %b\n", immediate_tb);
        if(immediate_tb == 12'b010101010101)
            $display("Ta OK\n");
        else
            $display("Nao Ta OK");
        $stop; 
    end
endmodule