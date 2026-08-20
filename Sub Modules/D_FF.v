module D_FF(
    input wire i_D,
    input wire i_clk,
    input wire i_pre_n,   //Async Input
    input wire i_clr_n,
    output reg o_Q
);
    always@(posedge i_clk or negedge i_clr_n or negedge i_pre_n)begin
        if(!i_clr_n)begin   
            o_Q <= 1'b0;        //Wire this to zero in topmod to avoid LockUp conditon
        end
        else if(!i_pre_n)begin
            o_Q <= 1'b1;
        end
        else begin
            o_Q <= i_D;
        end
    end
endmodule
