module XOR_Gate(
    input wire i_rst_n,
    input wire i_a,
    input wire i_b,
    output reg o_y
);  
    always@(*)begin
        if(!i_rst_n)
            assign o_y = 1'b0;
        else 
            assign o_y = i_a ^ i_b;
    end
endmodule
