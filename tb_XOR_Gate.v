`timescale 1ns / 1ps
module tb_XOR_Gate();
    reg i_rst_n;
    reg i_a;
    reg i_b;
    wire o_y;
    
    //DUT 
    XOR_Gate dut (
        .i_rst_n(i_rst_n),
        .i_a(i_a),
        .i_b(i_b),
        .o_y(o_y)
    );
    
    task initialize;
        begin
            i_a = 1'b0;
            i_b = 1'b0;
        end
    endtask
    
    task reset;
        begin
            #10 i_rst_n = 1'b1;     //High Reset
            #20 i_rst_n = 1'b0;     //Low Reset
            i_rst_n = 1'b1;         //High Reset
        end
    endtask
    
    task set_value;
        begin
            #10 i_a = 0; i_b = 0;
            #10 i_a = 0; i_b = 1;
            #10 i_a = 1; i_b = 0;
            #10 i_a = 1; i_b = 1;
        end
    endtask
    
    initial begin
        reset;
        initialize;
        #10;
        set_value;
    end
    
    initial $monitor("Time = %0dns |Reset = %b| In1 = %b | In2 = %b | Out = %b", $time,i_rst_n,i_a,i_b,o_y);
endmodule
