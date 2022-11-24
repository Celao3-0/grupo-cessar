`timescale 1ns / 100 ps
module testbench();
    reg contro_tb, reset_tb, clk_tb;
    reg [31:0] datain_tb;
    wire [31:0] dataout_tb;
    parameter sete = 32'b00000000000000000000000000000111,
             oito = 32'b00000000000000000000000000001000;
	integer i = 0;
    PC uut (.datain(datain_tb), .dataout(dataout_tb), .contro(contro_tb), .reset(reset_tb), .clk(clk_tb));
    always #5 clk_tb = ~clk_tb;

    initial begin
        clk_tb = 0;
        reset_tb = 1;
        contro_tb = 0;
        #50 
        reset_tb = 0;
        contro_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 1;
        contro_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 0;
        contro_tb = 1;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == sete) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 0;
        contro_tb = 1;
        datain_tb = oito;
        i = i + 1;
        #10
        if(dataout_tb == oito) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 0;
        contro_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == oito) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 1;
        contro_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 0;
        contro_tb = 0;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 1;
        contro_tb = 1;
        datain_tb = oito;
        i = i + 1;
        #10
        if(dataout_tb == 0) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        #50
        reset_tb = 0;
        contro_tb = 1;
        datain_tb = sete;
        i = i + 1;
        #10
        if(dataout_tb == sete) begin
            $display("TESTE %b CORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i,reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        else begin
            $display("TESTE %b INCORRETO\nreset = %b\ncontro = %b\n->entrada = %b; saida = %b\n", i, reset_tb, contro_tb, datain_tb, dataout_tb);
            $display("\n");
        end
        $stop; 
    end
endmodule   