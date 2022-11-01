module flipflopD(clock,D,Q,Qbar);
 input clock, D;
 output reg Q;
 output Qbar;
 assign Qbar= ~ Q;
 always @(posedge clock)
 Q=D;
endmodule