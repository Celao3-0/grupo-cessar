module ALU_TB();
  reg [0:5] aluOperation;
  reg [0:31] x;
  reg [0:31] y;
  wire [0:31] out;
  wire zr;
  wire ng;
 
  ALU dut (
    .aluOperation(aluOperation),
    .x(x),
    .y(y),
    .out(out),
    .zr(zr),
    .ng(ng)
  );
 
  initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, ALU_TB);
    assign aluOperation = 6'b000010;
    assign x = 32'b00000000000000011111100000000000;
    assign y = 32'b00000000000000011111100000000000;
    #20
    $finish;
  end
 
endmodule
