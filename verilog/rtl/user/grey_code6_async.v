#include "common.vh"

module grey_code6_async
(
 `POWER_IN
 input        rst,
 input        incr,
 output [5:0] grey
);

////////////////////////////////////////
   reg [5:0]  r_next, r_grey;
   assign     grey   = r_grey;

   always @*
     if( rst )  begin
        r_grey      = #1 'd0;
        r_next      = #1 f_grey6( 'd0 );
     end
     else if( incr ) begin
        r_grey      = #1 r_next;
        r_next      = #1 f_grey6( r_next );
     end

endmodule
