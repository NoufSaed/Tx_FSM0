`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2024 21:05:00
// Design Name: 
// Module Name: tb_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_TxFSM;

    logic clk;
    logic reset_n;
    logic en_tx;
    logic [2:0] count;
    

    Tx_FSM uut (
        .clk(clk),
        .reset_n(reset_n),
        .en_tx(en_tx),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
     
        reset_n = 0;
        en_tx = 0;
        count = 0;

        #10 reset_n = 1;

        #10 en_tx = 1;

        #10 en_tx = 0; count = 3;

        repeat (5) begin
            #10 count = count + 1;
        end

        #10 count = 7;

        #10 count = 0;

        #10 $finish;
    end

   
endmodule
