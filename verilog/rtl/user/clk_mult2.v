#include "common.vh"

module clk_mult2
(
 `POWER_IN
 input  rst,
 input  clk,

 output clk_2x
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   wire       w_clkn  = #1 ~ clk;
   reg        r_clk2x;
   assign     clk_2x  = r_clk2x;

   always @( w_reset or clk or w_clkn )
     if( w_reset )
       r_clk2x       <= 'b0;
     else
       r_clk2x       <= #1 ~ r_clk2x;

endmodule
