`timescale 1ns/1ps

module tb_SR();
    reg i_data;
    reg i_clr_n;
    reg i_pre_n;
    reg i_clk;
    wire o_data;
    
    //DUT
    SR dut (
        .i_data(i_data),
        .i_clr_n(i_clr_n),
        .i_pre_n(i_pre_n),
        .i_clk(i_clk),
        .o_data(o_data)
    );
    
    initial begin
        $display("Time(ns)\tclk\tclr_n\tpre_n\ti_data\tSR_State[Q1:Q4]\to_data");
        $monitor("%0t\t\t%b\t%b\t%b\t%b\t%b%b%b%b\t\t%b", $time, i_clk, i_clr_n, i_pre_n, i_data, 
                 dut.w1, dut.w2, dut.w3, o_data, o_data);
    end
    
    initial i_clk = 1'b0;
    always #5 i_clk = ~i_clk;
    
    //Reset
    task reset;
        begin
            @(negedge i_clk) i_pre_n = 1'b0;    //Assert Preset
            @(negedge i_clk) i_pre_n = 1'b1;    //Deassert Preset
        end
    endtask
    
    //Clear
    task clear;
        begin
            @(negedge i_clk) i_clr_n = 1'b0;    //Assert clear
            @(negedge i_clk) i_clr_n = 1'b1;    //Deassert clear
        end
    endtask
    
    //Initialize
    task initialize;
        begin
        //Initialize the values immediately to avoid X propagation       
            i_clr_n = 1'b1;
            i_pre_n = 1'b1;
            i_data = 1'b0;
        end
    endtask
    
    //Stimulus
    integer i;
    initial begin
        initialize;
        clear;
        reset;
        for(i=1;i<=15;i=i+1)begin
            @(negedge i_clk) i_data = i[0];
        end
        repeat (4) @(negedge i_clk);
        
        $finish;
    end
endmodule
