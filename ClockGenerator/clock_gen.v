module ClockGen (clk);
    output reg clk;

    initial clk = 0;

    always 
        #50 clk = ~clk;
endmodule