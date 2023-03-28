#include "common.vh"

module clk_compare
(
 `POWER_IN
 input        rst,
 input        ref_clk,
 input        dut_clk,

 output [7:0] mult, frac
);

////////////////////////////////////////
   wire       w_rst;
   reset m_reset( `POWER .clk( ref_clk ), .rst( rst ), .reset( w_rst ) );

////////////////////////////////////////
   reg [7:0]   r_ref_div, r_ref_next;

   always_ff @( posedge ref_clk )
     if( w_rst) begin
        r_div       <= 'd0;
        r_next      <= 'd1;
     end
     else begin
        r_div       <= r_next;
        r_next      <= r_next + 'd1;
     end


endmodule
