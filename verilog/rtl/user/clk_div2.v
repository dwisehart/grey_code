#include "common.vh"

module clk_div2
(
 `POWER_IN
 input  rst,
 input  clk,

 output clk_div2
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   reg        r_div2
   assign     clk_div2  = r_div2;

   always_ff @( posedge clk )
     if( w_rst )
       r_div2        <= 'b0;
     else
       r_div2        <= ~ r_div2;

endmodule
