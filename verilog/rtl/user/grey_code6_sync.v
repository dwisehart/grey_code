#include "common.vh"

module grey_code6_sync
(
 `POWER_IN
 input        clk,
 input        rst,
 input        incr_sync,
 output [5:0] grey
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   reg [5:0]  r_next, r_grey;
   assign     grey   = r_grey;

   always_ff @( posedge clk )
     if( w_rst )  begin
        r_grey      <= 'd0;
        r_next      <= f_grey6( 'd0 );
     end
     else if( incr_sync ) begin
        r_grey      <= r_next;
        r_next      <= f_grey6( r_next );
     end

endmodule
