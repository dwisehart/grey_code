#include "common.svh"

module grey_code6
(
`ifdef USE_POWER_PINS
 inout vccd1,	// User area 1 1.8V supply
 inout vssd1,	// User area 1 digital ground
`endif

 input        clk,
 input        rst,
 input        incr,
 output [5:0] grey
);

////////////////////////////////////////
   reg [7:0]  r_reset          = 'hFF;
   wire       w_reset          = r_reset[7];

   always_ff @( posedge clk )
     if( rst )
       r_reset     <= 'hFF;
     else
       r_reset     <= { r_reset, 1'b0 };

////////////////////////////////////////
   reg [3:0]  r_incr;
   wire       w_incr           = r_incr[2] & ~ r_incr[3];

   always_ff @( posedge clk )
     if( w_reset )
       r_incr      <= 'd0;
     else
       r_incr      <= { r_incr, incr };

////////////////////////////////////////
   reg [5:0]  r_next;

   always_ff @( posedge clk )
     if( w_reset )  begin
        r_grey     <= 'd0;
        r_next     <= f_grey6( 'd0 );
     end
     else if( w_incr ) begin
        r_grey     <= r_next;
        r_next     <= f_grey6( r_next );
     end

endmodule
