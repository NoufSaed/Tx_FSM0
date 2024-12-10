`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2024 13:36:26
// Design Name: 
// Module Name: control
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


module Tx_FSM(
    input logic clk,
    input logic reset_n,
    input logic en_tx,
    input logic [2:0] count,
    output logic S ,en_cout
);

    typedef enum logic [2:0] {
        IDLE,
        START,
        TX_DATA,
        PARITY
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always_comb begin
        case (current_state)
            IDLE:next_state = (en_tx) ? START : IDLE; // if the en_tx true =1 
            START:next_state = TX_DATA;
            TX_DATA:next_state = (count > 7) ? PARITY : TX_DATA;
            PARITY:next_state = IDLE;
            default:next_state = IDLE;
        endcase
    end
    
always_comb begin
        case (current_state)
    
         IDLE: begin
             S=3;
         end
          START: begin
            S=0;
            en_cout=0;
          end
          TX_DATA: begin
            S=1;
            en_cout=1;
          end
          PARITY:begin
            S=2;
          end 
          
          endcase
          
          end
          
endmodule
