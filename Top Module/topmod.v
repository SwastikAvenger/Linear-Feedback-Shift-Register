
module topmod(
        input wire i_sys_clk,       //system clock
        input wire i_clr_n,         //active low clear
        input wire i_pre_n,         //active low preset
        output wire [3:0] o_data    //output data
    );
    
        wire w_clk_out;         //output divided clock, from IP
        wire w_locked;          //high when MMCM is stabilized
        
        //Clocking wizard dut
        clk_wiz_0 clk_wiz_0 (
            .clk_in1 (i_sys_clk),
            .clk_out1(w_clk_out),
            .reset(1'b0),      
            .locked(w_locked)
        );
        
        //lfsr topmod dut
        lfsr_top dut(
            .i_clk(w_clk_out),
            .i_clr_n(i_clr_n & w_locked),
            .i_pre_n(i_pre_n),
            .o_data(o_data)
        );
endmodule
