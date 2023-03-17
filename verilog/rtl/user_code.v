#include "common.svh"

module grey_code #
(
 parameter BITS = 32
)
(
`ifdef USE_POWER_PINS
 inout vdda1,	// User area 1 3.3V supply
 inout vssa1,	// User area 1 analog ground
 inout vccd1,	// User area 1 1.8V supply
 inout vssd1,	// User area 1 digital ground
`endif

 input          wb_clk_i,
 input          wb_rst_i,
 input          wbs_stb_i,
 input          wbs_cyc_i,
 input          wbs_we_i,
 input [3:0]    wbs_sel_i,
 input [31:0]   wbs_dat_i,
 input [31:0]   wbs_adr_i,
 output         wbs_ack_o,
 output [31:0]  wbs_dat_o,
 output [2:0]   irq,

 input          user_clock2,

 input [37:0]   io_in,
 output [37:0]  io_out,
 output [37:0]  io_oeb,
 inout [28:0]   analog_io,

 input [127:0]  la_data_in,
 output [127:0] la_data_out,
 input [127:0]  la_oenb
);

////////////////////////////////////////
   wire         clk              = user_clock2;
   wire         w_la_rst         = la_data_in[127];
   wire         w_la_incr        = la_data_in[126];

   reg [5:0]    r_grey;
   assign      lo_data_out[5:0]  = r_grey;

////////////////////////////////////////
   reg [7:0]    r_reset          = 'hFF;
   wire         w_reset          = r_reset[7];

   always_ff @( posedge clk )
     if( w_la_rst )
       r_reset     <= 'hFF;
     else
       r_reset     <= { r_reset, 1'b0 };

////////////////////////////////////////
   reg [3:0]    r_incr;
   wire         w_incr           = r_incr[2] & ~ r_incr[3];

   always_ff @( posedge clk )
     if( w_reset )
       r_incr     <= 'd0;
     else
       r_incr     <= { r_incr, w_la_incr };

////////////////////////////////////////
   reg [5:0]    r_next;

   always_ff @( posedge clk )
     if( w_reset )  begin
        r_grey    <= 'd0;
        r_next    <= f_grey6( 'd0 );
     end
     else if( w_incr ) begin
        r_grey    <= r_next;
        r_next    <= f_grey6( r_next );
     end

endmodule
