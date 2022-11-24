module  PC(datain, dataout, contro, reset, clk);
    input [31:0] datain;       /*dados de entrada*/
    input clk, contro, reset;  /*sinais de controle*/
    output reg [31:0] dataout; /*dados de saida*/
    initial begin
        dataout = 32'd0;       /*inicializando a saida como zero*/
    end
    always @(posedge clk) begin
        if(reset == 1'b1) dataout = 32'd0;       /*reset ligado na subida do clock: a saida eh zerada*/
        else begin
            if(contro == 1'b1) dataout = datain; /*contro vale como enable, seta o valor da saida com a palavra de entrada*/
        end
    end
endmodule
