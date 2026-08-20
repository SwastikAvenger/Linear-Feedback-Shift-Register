
module lfsr_top(
    input wire i_clk,
    input wire i_clr_n,
    input wire i_pre_n,
    output wire [3:0] o_data
);
    wire w1,w2,w3,w4;
    wire w_f;           //feedback wire, for input to the first register
    
    assign o_data = {w1, w2, w3, w4};   //output pseudo random data
    assign w_f = w3 ^ w4;               //Tapping 4th and 3rd bit
    
    SR dut(
        .i_data(w_f),
        .i_clk(i_clk),
        .i_pre_n(i_pre_n),
        .i_clr_n(i_clr_n),
        .o_data(w4)
    );
    
    assign w1 = dut.w1;
    assign w2 = dut.w2;
    assign w3 = dut.w3;
endmodule
