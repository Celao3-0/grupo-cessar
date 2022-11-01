module flipflopD(clock,D,Q,Qbar);
 input clock, D;
 assign D = 1'b1;
 output reg Q;
 output Qbar;
 assign Qbar= ~ Q;
 always @(posedge clock)
 Q=D;
endmodule