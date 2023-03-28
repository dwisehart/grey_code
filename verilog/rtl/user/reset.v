#include "common.vh"

module reset
(
 `POWER_IN
 input        clk,
 input        rst,
 output       reset
);

////////////////////////////////////////
   reg [7:0]  r_reset          = 'hFF;
   assign     reset            = r_reset[7];

   always_ff @( posedge clk )
     if( rst )
       r_reset     <= 'hFF;
     else
       r_reset     <= { r_reset, 1'b0 };

endmodule
