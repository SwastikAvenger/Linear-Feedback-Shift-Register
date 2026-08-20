module SR(
    input wire i_data,
    input wire i_clk,
    input wire i_pre_n,
    input wire i_clr_n,
    output wire o_data
);
    wire w1, w2, w3;
     
    D_FF d1 (
        .i_D(i_data),
        .i_clk(i_clk),
        .i_pre_n(i_pre_n),
        .i_clr_n(i_clr_n),
        .o_Q(w1)
    );
    
    D_FF d2 (
        .i_D(w1),
        .i_clk(i_clk),
        .i_pre_n(i_pre_n),
        .i_clr_n(i_clr_n),
        .o_Q(w2)
    );
    
    D_FF d3 (
        .i_D(w2),
        .i_clk(i_clk),
        .i_pre_n(i_pre_n),
        .i_clr_n(i_clr_n),
        .o_Q(w3)
    );
    
    D_FF d4 (
        .i_D(w3),
        .i_clk(i_clk),
        .i_pre_n(i_pre_n),
        .i_clr_n(i_clr_n),
        .o_Q(o_data)
    );    
endmodule