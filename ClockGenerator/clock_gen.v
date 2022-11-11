module ClockGen (CLK);
    output reg CLK;

    initial CLK = 0;

    always 
        #50 CLK = ~CLK;
endmodule