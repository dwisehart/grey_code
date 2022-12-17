#include "common.svh"

module grey_code
(
 input        i_clk,
 input        i_incr,
 output [5:0] o_grey_code
);

////////////////////////////////////////
   reg [7:0]  r_reset  = 8'hFF;
   wire       w_reset  = r_reset[7];
   always_ff @( posedge i_clk )
      r_reset  <= { r_reset, 1'b0 };

////////////////////////////////////////
   reg [5:0]  r_grey, r_next;
   assign     o_grey_code  = r_grey;
   always_ff @( posedge i_clk )
      if( w_reset )  begin
         r_grey    <= 'd0;
         r_next    <= f_grey6( 'd0 );
      end
      else if( i_incr ) begin
         r_grey    <= r_next;
         r_next    <= f_grey6( r_next );
      end

endmodule
