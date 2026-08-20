`timescale 1ns/1ps

module tb_lfsr_top();
    reg i_clk;
    reg i_clr_n;
    reg i_pre_n;
    wire [3:0] o_lfsr;

    // DUT 
    lfsr_top dut (
        .i_clk(i_clk),
        .i_clr_n(i_clr_n),
        .i_pre_n(i_pre_n),
        .o_data(o_lfsr)
    );

    initial i_clk = 1'b0;
    always #5 i_clk = ~i_clk;

    // Monitor 
    initial begin
        $display("Time(ns)\tclk\tclr_n\tpre_n\tLFSR_State[Q1:Q4]");
        $monitor("%0t\t\t%b\t%b\t%b\t%b", $time, i_clk, i_clr_n, i_pre_n, o_lfsr);
    end

    // Stimulus 
    initial begin
        i_clr_n = 1'b1;
        i_pre_n = 1'b1;

        @(negedge i_clk) i_pre_n = 1'b0;
        @(negedge i_clk) i_pre_n = 1'b1;

        repeat (16) @(posedge i_clk);

        $finish;
    end
endmodule