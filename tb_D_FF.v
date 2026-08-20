`timescale 1ns/1ps
module tb_D_FF();
    reg i_D;
    reg i_clk;
    reg i_clr_n;
    reg i_pre_n;
    wire o_Q;
    
    //DUT
    D_FF dut (
        .i_D(i_D),
        .i_clk(i_clk),
        .i_clr_n(i_clr_n),
        .i_pre_n(i_pre_n),
        .o_Q(o_Q)
    );
    
    //Clock
    initial i_clk = 1'b0;
    always #5 i_clk = ~i_clk;
    
    //reset task
    task reset;
        begin
            @(negedge i_clk) i_pre_n = 1'b0;
            @(negedge i_clk) i_pre_n = 1'b1;
        end
    endtask
    
    //clear task
    task clear;
        begin
            @(negedge i_clk) i_clr_n = 1'b0;
            @(negedge i_clk) i_clr_n = 1'b1;
        end
    endtask
    
    //initialize task
    task initialize;
        begin                   //Initialize at t=0, to avoid X Propagation
            i_D = 1'b0;
            i_clr_n = 1'b1;
            i_pre_n = 1'b1;
        end
    endtask
    
    integer i;
    initial begin
        initialize;
        clear;
        reset;
        for(i=0;i<4;i=i+1)begin
            @(negedge i_clk) i_D <= i[0];
        end
        
        #20;
        $finish;
    end
    
endmodule