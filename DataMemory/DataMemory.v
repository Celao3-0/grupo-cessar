module data_memory(input clk,       
                   input mem_read,
                   input mem_write,
                   input [31:0] endereco,
                   input [31:0] write_data,
                   output reg [31:0] read_data
                   );
                   
   reg [4:0] endereco_atual;
   reg [31:0] Memory [31:0];
   integer i;


    // zera a memória inteira e adiciona no final
   initial begin
        for (i = 0; i < 1024; i = i + 1) begin
            Memory[i] = 32'd0;
        end
        Memory[0] = 32'b00000000000000000000111111111111;
   end
   
   //  asincron
   always @* begin
        endereco_atual = endereco[4:0];
        
        if (mem_read == 1) begin
              read_data = Memory[endereco_atual];  
        end
   end  
   
   // sincron
   always @(posedge clk) begin
        endereco_atual = endereco[4:0];
        
        if (mem_write == 1) begin
            Memory[endereco_atual] = write_data;
        end
   end      
                   
           
endmodule