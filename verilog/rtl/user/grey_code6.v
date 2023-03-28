#include "common.vh"

module grey_code6
(
`POWER_IN
 input        clk,
 input        rst,
 input        incr,
 output [5:0] grey
);

////////////////////////////////////////
   wire       w_reset;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_reset ) );

////////////////////////////////////////
   reg [3:0]  r_incr;
   wire       w_incr           = r_incr[2] & ~ r_incr[3];

   always_ff @( posedge clk )
     if( w_reset )
       r_incr      <= 'd0;
     else
       r_incr      <= { r_incr, incr };

////////////////////////////////////////
   grey_code6_sync m_grey_sync( `POWER .clk( clk ), .rst( rst ), .incr_sync( w_incr ), .grey( grey ) );

endmodule
