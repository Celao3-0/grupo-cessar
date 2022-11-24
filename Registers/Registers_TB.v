`timescale 1ns/100ps
module testbench () ;
    reg [4:0] readRegister1;
    reg [4:0] readRegister2;
    reg [4:0] writeRegister;
    reg [31:0] writeData;
    reg regWrite;
    reg clk;
    wire [31:0] readData1;
    wire [31:0] readData2;

    Registers UUT (.readRegister1(readRegister1), .readRegister2(readRegister2), .writeRegister(writeRegister), .regWrite(regWrite), .clk(clk), .readData1(readData1), .readData2(readData2));

    integer i, errors;
    task Check ;
        input xpect;
        if (Q != xpect) begin
                $display ("Error : D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);
                errors = errors + 1;
        end
    endtask

        initial clock = 0;
        always #10 clock =~ clock;


        initial begin
        errors = 0;
        reset = 0;
        
        


        $display (" Test ended , %2d errors ", errors );
    end
endmodule